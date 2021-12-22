package com.me.wamp.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import com.me.wamp.pojo.Artist;

public class ArtistDAO extends DAO {
	public int createArtist(Artist artist) {
        try {
            begin();
            int artistid = (Integer) getSession().save(artist);
            commit();
            return artistid;
        } catch (Exception e) {
            rollback();
        }
        System.out.println("Artist saved in the DataBase");
        return 0;
    }
    
    public Artist getArtist(int artistid) {
        try {
        	return getSession().get(Artist.class, artistid);
        } catch (HibernateException e) {
        	return null;
        }
    }
    
    public List<Artist> getAllArtists() {
    	List<Artist> artistList = new ArrayList<Artist>();
    	try {
    		begin();
            Criteria crit = getSession().createCriteria(Artist.class);
            artistList = crit.list();
            commit();
    		return artistList;
    	} catch(HibernateException e) {
    		return null;
    	}
    }

    public void deleteArtist(Artist artist) {
        try {
	    	begin();
	        getSession().delete(artist);
	        commit();
    		System.out.println("Deleted Artist");
        } catch(HibernateException e) {
        	rollback();
    		System.out.println("Couldn't delete Artist");
        }
    }
    
    public void updateArtist(Artist artist) {
    	try {
	    	begin();
	        getSession().update(artist);
	        commit();
    		System.out.println("Updated Artist");
    	} catch(HibernateException e) {
    		rollback();
    		System.out.println("Couldn't update Artist");
    	}
    }
    
}