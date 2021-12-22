package com.me.wamp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;

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

import com.me.wamp.dao.FileDAO;
import com.me.wamp.dao.MediaDAO;
import com.me.wamp.pojo.Media;
import com.me.wamp.validation.MediaValidator;

@Controller
public class MediaController {

    @Autowired
    MediaValidator mediaValidator;

    @GetMapping("/media/browse.htm")
    public String browseMedia(MediaDAO mediadao, HttpServletRequest request) {
        ArrayList<Media> mediaList = (ArrayList<Media>) mediadao.getAllMedia();
        request.setAttribute("mediaList", mediaList);
        return "media-browseList";
    }
    
    @GetMapping("/media/save.htm")
    public String saveMediaGet(ModelMap model) {
        Media media = new Media();
        model.addAttribute("media", media);
        return "media-add";
    }
    
    @PostMapping("/media/save.htm")
    public String saveMediaPost(@ModelAttribute("media") Media media, BindingResult result, SessionStatus status, MediaDAO mediadao) {
        mediadao.createMedia(media);
                
        String view=null;
        if (result.hasErrors())
            view = "media-add";
        else {
            status.isComplete();
            view = "media-addSuccess";
        }
        return view;
    }

    @GetMapping("/media/search.htm")
    public String searchMediaGet(MediaDAO mediadao, HttpServletRequest request) {
    	String media = request.getParameter("search");
    	
    	ArrayList<Media> mediaList = (ArrayList<Media>) mediadao.getMedia(media);
    	
    	request.setAttribute("mediaList", mediaList);
    	return "media-list";
    }

    @GetMapping("/media/delete.htm")
    public String deleteMedia(MediaDAO mediadao, HttpServletRequest request) {
    	
    	String mediaid = request.getParameter("deleteMedia");
    	Media media = mediadao.getMediaById(Integer.parseInt(mediaid));
    	mediadao.deleteMedia(media);
    	
    	HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "media-browseList";
    }
    
    @GetMapping("/media/play.htm")
    public String playMedia(MediaDAO mediadao, FileDAO filedao, HttpServletRequest request) {
    	
    	String mediaid = request.getParameter("mediaid");
    	
    	Media media = mediadao.getMediaById(Integer.parseInt(mediaid));
    	
    	request.setAttribute("name", media.getName());
    	
    	if(media.getUrl().matches("https://www.youtube.com/(.*)")) {
    		request.setAttribute("url", "https://www.youtube.com/embed/"+media.getUrl().split("=")[1]+"?rel=0&showinfo=0&autohide=1&modestbranding=1&fs=0");
    		request.setAttribute("location", "web");
    	}
    	else {
    		try {
    			File file = new File("D:\\Eclipse\\sts-workspace\\WAMP\\src\\main\\webapp\\resources\\videos\\"+filedao.getFile(Integer.parseInt(media.getUrl())).getName());
    			OutputStream os = new FileOutputStream(file);
    			os.write(filedao.getFile(Integer.parseInt(media.getUrl())).getData());
    			os.close();
    			request.setAttribute("url", "http://localhost:8080/wamp/resources/videos/"+filedao.getFile(Integer.parseInt(media.getUrl())).getName());
        		request.setAttribute("location", "db");
    		} catch (Exception fe) {
    			fe.printStackTrace();
    		}
    	}
    	
    	if(media.getType().equals("Song")||media.getType().equals("song")) {
    		request.setAttribute("type", "song");
    	} else {
    		request.setAttribute("type", "video");
    	}
    	
    	return "media-play";
    }
    
    @PostMapping("/media/update.htm")
    public String updateMediaPost(@ModelAttribute("media") Media media, BindingResult result, SessionStatus status, MediaDAO mediadao) {
        mediadao.updateMedia(media);
                
        String view=null;
        if (result.hasErrors())
            view = "media-update";
        else {
            status.isComplete();
            view = "media-browseList";
        }
        return view;
    }
    
}