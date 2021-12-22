package com.me.wamp.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.me.wamp.dao.ArtistDAO;
import com.me.wamp.dao.FileDAO;
import com.me.wamp.dao.MediaDAO;
import com.me.wamp.dao.PlaylistDAO;
import com.me.wamp.dao.UserDAO;
import com.me.wamp.pojo.Artist;
import com.me.wamp.pojo.File;
import com.me.wamp.pojo.Media;
import com.me.wamp.pojo.Playlist;
import com.me.wamp.pojo.User;
import com.me.wamp.validation.AdminValidator;
import com.me.wamp.validation.UserValidator;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

@Controller
public class AdminController {

	@Autowired
	AdminValidator adminValidator;

	public AdminController() {

	}

	// Display Admin error form
	@GetMapping("/error.htm")
	public String showError(HttpServletRequest request) {
		return "admin-error";
	}

	// display Admin login form
	@GetMapping("/admin/login.htm")
	public String showLogin(ModelMap model) {
		User admin = new User();
		model.addAttribute("admin", admin);
		return "admin-login";
	}

	@PostMapping("/admin/login.htm")
	public String handleLoginForm(@ModelAttribute("admin") User admin, BindingResult result, SessionStatus status,
			HttpServletRequest request, ModelMap map, UserDAO userdao) {
		if (result.hasErrors()) {
			return "user-login";
		} else {
			HttpSession session = request.getSession(true);
			User a = userdao.getUser(admin);
			if (a != null) {
				session.setAttribute("currentAdmin", a);
				status.setComplete();
				return "admin-dashboard";
			} else {
				request.setAttribute("error", "Incorrect Admin Credentials");
				return "admin-login";
			}
		}
	}

	@GetMapping("/admin/save.htm")
	public String saveAdminGet(ModelMap model) {
		User admin = new User(); // FormBackingObject
		model.addAttribute("admin", admin);
		return "admin-registration";
	}

	@PostMapping("/admin/save.htm")
	public String saveAdminPost(@ModelAttribute("admin") User admin, BindingResult result, SessionStatus status,
			UserDAO userdao, PlaylistDAO playlistdao, HttpServletRequest request) {
		String view = null;
		if (result.hasErrors())
			view = "admin-login";
		else {
			User a = userdao.getUser(admin);
			if (a == null) {
				admin.setRole("admin");

				Playlist playlist = new Playlist();
				playlist.setName(admin.getUsername() + "_playlist");
				playlist.setType("song");
				playlistdao.createPlaylist(playlist);

				admin.setPlaylist(playlist);

				userdao.createUser(admin);

				sendEmail(request.getParameter("email"), admin.getUsername());

				status.isComplete();
				view = "admin-registrationSuccess";
			} else {
				request.setAttribute("error", "Admin already exists");
				view = "admin-registration";
			}
		}
		return view;
	}

	public void sendEmail(String email, String user) {
		String to = email;
		final String from = "wampmediaplayer@gmail.com";
		final String password = "Password@123";

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("WAMP Admin Registration!");
			message.setText("Hello " + user
					+ ", <br><br>Welcome to the world of WAMP.<br><br>You have successfully registered as an administrator on WAMP, a simple Web Accessible Media Player.<br><br> <a style=\"background-color: darkred; padding: 10px; color: white; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;\" href=\"http://localhost:8080/wamp/admin/login.htm\" target=\"_blank\">Let's Manage!</a><br><br>Thank You,<br>WAMP Team",
					"UTF-8", "html");

			// Send message
			Transport.send(message);
		} catch (Exception mex) {
			mex.printStackTrace();
		}
	}

	// display admin dashboard
	@GetMapping("/admin/dashboard.htm")
	public String showDashboard(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {
			return "admin-dashboard";
		} else
			return "home";
	}

	// display all users accounts
	@GetMapping("/admin/user.htm")
	public String manageUserAccount(HttpServletRequest request, UserDAO userdao) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			List<User> userList = userdao.getAllUsers();

			session.setAttribute("userList", userList);

			return "admin-userManagement";
		} else
			return "home";
	}

	@GetMapping("/admin/artist.htm")
	public String manageArtist(HttpServletRequest request, ArtistDAO artistdao) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			List<Artist> artistList = artistdao.getAllArtists();

			session.setAttribute("artistList", artistList);

			return "admin-artistManagement";
		} else
			return "home";
	}

	@GetMapping("/admin/artist/add.htm")
	public String artistAdd(HttpServletRequest request, ArtistDAO artistdao) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			Artist artist = new Artist();

			artist.setName(request.getParameter("artistName"));

			artistdao.createArtist(artist);

			return "admin-dashboard";
		} else
			return "home";
	}

	@GetMapping("/admin/artist/delete.htm")
	public String deleteArtistAdmin(MediaDAO mediadao, ArtistDAO artistdao, PlaylistDAO playlistdao,
			HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			int artistid = Integer.parseInt(request.getParameter("artistid"));
			Artist artist = artistdao.getArtist(artistid);

			List<Media> mediaList = mediadao.getAllMedia();

			for (Media m : mediaList) {
				if (m.getArtist().equals(artist)) {
					for (Playlist p : playlistdao.getAllPlaylists()) {
						p.removeMedia(m);
						playlistdao.updatePlaylist(p);
					}
					mediadao.deleteMedia(m);
				}
			}

			artistdao.deleteArtist(artist);

			session.setAttribute("artistList", artistdao.getAllArtists());
			session.setAttribute("mediaList", mediadao.getAllMedia());

			return "admin-dashboard";
		} else
			return "home";
	}

	@GetMapping("/userAdmin/delete.htm")
	public String deleteUserAdmin(UserDAO userdao, PlaylistDAO playlistdao, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			String userid = request.getParameter("userid");
			User user = userdao.getUserById(Integer.parseInt(userid));
			playlistdao.deletePlaylist(playlistdao.getPlaylist(user.getPlaylist().getPlaylistid()));
			userdao.deleteUser(user);
			return "admin-user-delete";
		} else
			return "home";
	}

	// display all media
	@GetMapping("/admin/media.htm")
	public String manageMedia(HttpServletRequest request, MediaDAO mediadao) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			List<Media> mediaList = mediadao.getAllMedia();

			session.setAttribute("mediaList", mediaList);

			return "admin-mediaManagement";
		} else
			return "home";
	}

	@GetMapping("/admin/media/delete.htm")
	public String deleteMediaAdmin(MediaDAO mediadao, ArtistDAO artistdao, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			String mediaid = request.getParameter("mediaid");
			Media media = mediadao.getMediaById(Integer.parseInt(mediaid));
			mediadao.deleteMedia(media);

			return "admin-media-delete";
		} else
			return "home";
	}

	@GetMapping("/admin/addMedia/add.htm")
	public String addMedia(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			return "admin-media-add";
		} else
			return "home";
	}

	@PostMapping("/admin/media/add.htm")
	public String addMedia(HttpServletRequest request, MediaDAO mediadao, ArtistDAO artistdao) throws Exception {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			Media media = new Media();
			System.out.println("URL");
			String mediaName = request.getParameter("mediaName");
			media.setName(mediaName);

			String mediaType = request.getParameter("mediaType");
			media.setType(mediaType);

			System.out.println(request.getParameter("mediaUrl"));
			String mediaUrl = request.getParameter("mediaUrl");
			media.setUrl(mediaUrl);

			List<Artist> artistList = artistdao.getAllArtists();

			session.setAttribute("media", media);
			session.setAttribute("artistList", artistList);

			return "admin-media-addArtist";
		} else
			return "home";
	}

	@PostMapping("/admin/media/addFile.htm")
	public String addMedia(HttpServletRequest request, MediaDAO mediadao, ArtistDAO artistdao, FileDAO filedao,
			@RequestParam("fileUpload") CommonsMultipartFile[] fileUpload) throws Exception {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			Media media = new Media();
			System.out.println("File");
			String mediaName = request.getParameter("mediaName");
			media.setName(mediaName);

			String mediaType = request.getParameter("mediaType");
			media.setType(mediaType);

			if (request.getParameter("mediaUrl") != null) {
				media.setUrl(request.getParameter("mediaUrl"));
			} else {
				int fileid = 0;
				try {
					System.out.println(request.getParameter("fileUpload"));
					fileid = handleFileUpload(fileUpload, filedao);
					media.setUrl(Integer.toString(fileid));
				} catch (Exception e) {
					System.out.println("Failed to upload Media");
					System.out.println(e.getStackTrace());
				}
			}

			List<Artist> artistList = artistdao.getAllArtists();

			session.setAttribute("media", media);
			session.setAttribute("artistList", artistList);

			return "admin-media-addArtist";
		} else
			return "home";
	}

	public int handleFileUpload(CommonsMultipartFile[] fileUpload, FileDAO filedao) throws Exception {
		if (fileUpload != null && fileUpload.length > 0) {
			for (CommonsMultipartFile aFile : fileUpload) {
				System.out.println("Saving file: " + aFile.getOriginalFilename());
				File uploadFile = new File();
				uploadFile.setName(aFile.getOriginalFilename());
				uploadFile.setData(aFile.getBytes());
				return (filedao.createFile(uploadFile));
			}
		}
		return 0;
	}

	@GetMapping("/admin/mediaAdd.htm")
	public String addMediaToDb(HttpServletRequest request, MediaDAO mediadao, ArtistDAO artistdao,
			PlaylistDAO playlistdao) {

		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			Media media = (Media) session.getAttribute("media");

			int mediaid = 0;
			String artistid = (String) request.getParameter("artist");
			Artist artist = null;

			if (artistid.split(":").length > 1) {
				artistid = artistid.split(":")[0];
				artist = artistdao.getArtist(Integer.parseInt(artistid));
			}

			if (artist == null) {
				artist = new Artist();
				artist.setName(request.getParameter("artist"));

				media.setArtist(artistdao.getArtist(artistdao.createArtist(artist)));

				mediaid = mediadao.createMedia(media);
			} else {
				media.setArtist(artist);

				mediaid = mediadao.createMedia(media);
			}
			Media updateMedia = mediadao.getMediaById(mediaid);
			updateMedia.setArtist(artist);
			mediadao.updateMedia(updateMedia);

			return "admin-dashboard";
		} else
			return "home";
	}

	@GetMapping("/admin/delete.htm")
	public String deleteUser(UserDAO userdao, PlaylistDAO playlistdao, HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession(true);
		if (session != null) {
			User admin = (User) session.getAttribute("currentAdmin");
			admin = userdao.getUserById(admin.getUserid());
			playlistdao.deletePlaylist(playlistdao.getPlaylist(admin.getPlaylist().getPlaylistid()));
			userdao.deleteUser(admin);
			session.invalidate();
		}
		User user = new User();
		model.addAttribute("user", user);
		return "user-login";
	}

	@GetMapping("/admin/update.htm")
	public String updateAdminGet(HttpServletRequest request) {
		// Update the admin instance using the DAO class
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			return "admin-update";
		} else
			return "home";
	}

	@PostMapping("/admin/update.htm")
	public String updateUserPost(@ModelAttribute("user") User admin, BindingResult result, SessionStatus status,
			UserDAO userdao, HttpServletRequest request) {
		// Update the user instance using the DAO class
		HttpSession session = request.getSession(true);
		if (session.getAttribute("currentAdmin")!=null) {

			User a = (User) session.getAttribute("currentAdmin");

			a.setUsername(request.getParameter("username"));
			a.setPassword(request.getParameter("password"));

			session.setAttribute("currentAdmin", a);
			userdao.updateUser(a);

			String view = null;
			if (result.hasErrors())
				view = "admin-update";
			else {
				status.isComplete();
				view = "admin-dashboard";
			}
			return view;
		} else
			return "home";
	}

	// log out admin
	@GetMapping("/admin/logout.htm")
	public String logoutAdmin(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		User user = new User();
		model.addAttribute("user", user);
		return "user-login";
	}
}