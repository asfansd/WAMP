package com.me.wamp.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import com.me.wamp.pojo.Playlist;
import com.me.wamp.pojo.Media;

public class PlaylistDAO extends DAO {
	public Playlist createPlaylist(Playlist playlist) {
        try {
            begin();
            getSession().save(playlist);
            commit();
            System.out.println("Playlist saved in the DataBase");
            return playlist;
        } catch (Exception e) {
            rollback();
            System.out.println("Could not add playlist: " +  e.getMessage());
			return null;
        }
    }
    
    public Playlist getPlaylist(int playlistid) {
    	try {
    		return getSession().get(Playlist.class, playlistid);
	    } catch(HibernateException e) {
			System.out.println("Error getting playlist"+e);
			return null;
		}
    }
    
    public List<Playlist> getPlaylistByName(String playlistName) {
    	try {
    		begin();
            Query q = getSession().createQuery("from Playlist where name = :playlistName");
            q.setString("playlistName", playlistName);
            List<Playlist> playList = q.getResultList();
            commit();
    		return playList;
    	} catch(HibernateException e) {
			System.out.println("Error getting playlist"+e);
			return null;
		}
    }
    
    public List<Playlist> getAllPlaylists() {
    	try {
    		begin();
            Query q = getSession().createQuery("from Playlist");
            List<Playlist> playList = q.getResultList();
            commit();
    		return playList;
    	} catch(HibernateException e) {
			System.out.println("Error getting playlist"+e);
			return null;
		}
    }

    public void deletePlaylist(Playlist playlist) {
    	try {
	    	begin();
	        getSession().delete(playlist);
	        commit();
    	} catch(HibernateException e) {
			System.out.println("Error deleting playlist"+e);
		}
    }
    
    public void updatePlaylist(Playlist playlist) {
        try {
        	begin();
        	getSession().merge(playlist);
        	commit();
        }
        catch (HibernateException e) {
        	rollback();
        	System.out.println("Could not update playlist: " +  e.getMessage());
		}
    }
    
    public List<Media> searchMedia(String mediaName, String playlistName){
		try {
			begin();
            Query q = getSession().createQuery("from Playlist where name = :playlistName");
            q.setString("playlistName", playlistName);
            List<Playlist> playList = q.getResultList();
            List<Media> list = playList.get(0).getMediaByName(mediaName);
			commit();
			return list;
		} catch (HibernateException e) {
			rollback();
			System.out.println("Could not search media: " + mediaName + " " +  e.getMessage());
			return null;
		}				
	}
	
	
	public void addMediaToPlaylist(Playlist playlist, Media media){
		try {
			List<Media> list = playlist.getMedialist();
			if(playlist.getMedia(media)!=null) {	
				list.add(media);
				playlist.setMedialist(list);
				this.updatePlaylist(playlist);
			}
		} catch(HibernateException e) {
			System.out.println("Couldn't add media to the  playlist");
		}
	}
	
	public void deleteMediaFromPlaylist(Playlist playlist, Media media){
		try {
			List<Media> list = playlist.getMedialist();
			if(playlist.getMedia(media)!=null) {	
				list.remove(media);
				playlist.setMedialist(list);
				this.updatePlaylist(playlist);
			}
		} catch(HibernateException e) {
			System.out.println("Couldn't delete media to the  playlist");
		}
	}
}