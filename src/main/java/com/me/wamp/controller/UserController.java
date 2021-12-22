package com.me.wamp.controller;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.me.wamp.dao.ArtistDAO;
import com.me.wamp.dao.MediaDAO;
import com.me.wamp.dao.PlaylistDAO;
import com.me.wamp.dao.UserDAO;
import com.me.wamp.pojo.Media;
import com.me.wamp.pojo.Playlist;
import com.me.wamp.pojo.User;
import com.me.wamp.validation.UserValidator;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

@Controller
public class UserController {

	@Autowired
	UserValidator userValidator;

	@GetMapping("/user/login.htm")
	public String showLoginForm(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		return "user-login";
	}

	@PostMapping("/user/login.htm")
	public String handleLoginForm(@ModelAttribute("user") User user, BindingResult result, SessionStatus status,
			UserDAO userdao, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "user-registration";
		} else {
			HttpSession session = request.getSession(true);
			User u = userdao.getUser(user);
			if (u != null) {
				session.setAttribute("currentUser", u);
				System.out.println(u.getPlaylist());
				status.setComplete();
				return "user-dashboard";
			} else {
				request.setAttribute("error", "Incorrect Credentials");
				return "user-login";
			}
		}
	}

	@GetMapping("/user/save.htm")
	public String saveUserGet(ModelMap model) {
		User user = new User(); // FormBackingObject
		model.addAttribute("user", user);
		return "user-registration";
	}

	@PostMapping("/user/save.htm")
	public String saveUserPost(@ModelAttribute("user") User user, BindingResult result, SessionStatus status,
			UserDAO userdao, PlaylistDAO playlistdao, HttpServletRequest request) {
		String view = null;
		if (result.hasErrors())
			view = "user-registration";
		else {
			User u = userdao.getUser(user);
			if (u == null) {
				user.setRole("user");

				Playlist playlist = new Playlist();
				playlist.setName(user.getUsername() + "_playlist");
				playlist.setType("song");

				playlistdao.createPlaylist(playlist);

				user.setPlaylist(playlist);

				userdao.createUser(user);

				sendEmail(request.getParameter("email"), user.getUsername());

				status.isComplete();
				view = "user-registrationSuccess";
			} else {
				request.setAttribute("error", "User already exists");
				view = "user-registration";
			}
		}
		return view;
	}

	public void sendEmail(String email, String username) {
		String to = email;
		final String from = "wampmediaplayer@gmail.com";
		final String password = "Password@123";

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		// get Session
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("!WAMPED!");
			message.setText("Hello " + username
					+ ", <br><br>Welcome to the world of WAMP.<br><br>You have successfully registered on WAMP, a simple Web Accessible Media Player to cater to your Media needs.<br><br> <a style=\"background-color: darkgreen; padding: 10px; color: white; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;\" href=\"http://localhost:8080/wamp/user/login.htm\" target=\"_blank\">Let's WAMP!</a><br><br>Thank You,<br>WAMP Team.",
					"UTF-8", "html");

			// Send message
			Transport.send(message);
		} catch (Exception mex) {
			mex.printStackTrace();
		}
	}

	@GetMapping("/user/mediaSearch.htm")
	public String searchMediaGet(@ModelAttribute("user") User user, BindingResult result, SessionStatus status,
			UserDAO userdao, MediaDAO mediadao, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentUser") != null) {
			User u = (User) session.getAttribute("currentUser");
			if (u.getRole().equals("user")) {
				String medianame = request.getParameter("media-keyword");
				ArrayList<Media> mediaList = (ArrayList<Media>) mediadao.getMedia(medianame);
				if (mediaList.size() > 0) {
					request.setAttribute("mediaList", mediaList);
					return "user-media-list";
				} else {
					request.setAttribute("error", "Media does not exist");
					return "user-dashboard";
				}
			}
			return "user-dashboard";
		} else
			return "home";
	}

	@GetMapping("/user/userSearch.htm")
	public String searchUserGet(@ModelAttribute("user") User user, BindingResult result, SessionStatus status,
			UserDAO userdao, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentUser") != null) {
			String username = request.getParameter("user-keyword");
			User searchUser = userdao.getUserByUsername(username);
			if (searchUser != null) {
				request.setAttribute("userList", searchUser);
				return "user-user-list";
			} else {
				request.setAttribute("error", "User not found");
				return "user-dashboard";
			}
		} else
			return "home";
	}

	@GetMapping("/user/userDashboard.htm")
	public String userDasboard(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentUser") != null) {
			return "user-dashboard";
		} else
			return "home";
	}

	@GetMapping("/user/logout.htm")
	public String logoutUser(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		User user = new User();
		model.addAttribute("user", user);
		return "user-login";
	}

	@GetMapping("/user/delete.htm")
	public String deleteUser(UserDAO userdao, PlaylistDAO playlistdao, HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession(true);
		if (session != null) {
			User user = (User) session.getAttribute("currentUser");
			user = userdao.getUserById(user.getUserid());
			playlistdao.deletePlaylist(playlistdao.getPlaylist(user.getPlaylist().getPlaylistid()));
			userdao.deleteUser(user);
			session.invalidate();
		}
		User user = new User();
		model.addAttribute("user", user);
		return "user-login";
	}

	@GetMapping("/user/playlist.htm")
	public String userPlaylist(HttpServletRequest request, PlaylistDAO playlistdao) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentUser") != null) {
			return "user-playlist";
		} else
			return "home";
	}

	@GetMapping("/user/addMedia.htm")
	public String userAddMediaPlaylist(MediaDAO mediadao, UserDAO userdao, PlaylistDAO playlistdao,
			HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentUser") != null) {
			int mediaid = Integer.parseInt(request.getParameter("mediaid"));
			Media media = mediadao.getMediaById(mediaid);
			Playlist playlist = ((User) session.getAttribute("currentUser")).getPlaylist();
			playlist.addMedia(media);
			((User) session.getAttribute("currentUser")).setPlaylist(playlist);
			playlistdao.updatePlaylist(playlist);
			userdao.updateUser(((User) session.getAttribute("currentUser")));
			return "user-playlist";
		} else
			return "home";
	}

	@GetMapping("/user/deleteMedia.htm")
	public String userDeleteMediaPlaylist(MediaDAO mediadao, UserDAO userdao, PlaylistDAO playlistdao,
			HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentUser") != null) {
			int mediaid = Integer.parseInt(request.getParameter("mediaid"));
			Media media = mediadao.getMediaById(mediaid);
			Playlist playlist = ((User) session.getAttribute("currentUser")).getPlaylist();
			System.out.println(playlist.getMedialist().size());
			playlist.removeMediaById(mediaid);
			((User) session.getAttribute("currentUser")).setPlaylist(playlist);
			playlistdao.updatePlaylist(playlist);
			userdao.updateUser((User) session.getAttribute("currentUser"));
			return "user-playlist";
		} else
			return "home";
	}

	@GetMapping("/user/update.htm")
	public String updateUserGet(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentUser") != null) {
			return "user-update";
		} else
			return "home";
	}

	@PostMapping("/user/update.htm")
	public String updateUserPost(@ModelAttribute("user") User user, BindingResult result, SessionStatus status,
			UserDAO userdao, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentUser") != null) {
			User u = (User) session.getAttribute("currentUser");
			u.setUsername(request.getParameter("username"));
			u.setPassword(request.getParameter("password"));
			session.removeAttribute("currentUser");
			session.setAttribute("currentUser", u);
			userdao.updateUser(u);

			String view = null;
			if (result.hasErrors())
				view = "user-update";
			else {
				status.isComplete();
				view = "user-dashboard";
			}
			return view;
		} else
			return "home";
	}

}