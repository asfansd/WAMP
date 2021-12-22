package com.me.wamp.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import com.me.wamp.pojo.Artist;
import com.me.wamp.pojo.Media;
import com.me.wamp.pojo.User;

public class MediaDAO extends DAO {
	public int createMedia(Media media) {
		try {
			begin();
			Integer mediaid = (Integer) getSession().save(media);
			commit();
			return mediaid;
		} catch (Exception e) {
			rollback();
		}
		System.out.println("Media saved in the DataBase");
		return 0;
	}

	public Media getMediaById(int mediaid) {
		try {
			return getSession().get(Media.class, mediaid);
		} catch(HibernateException e) {
			System.out.println("Error getting media"+e);
			return null;
		}
	}
	
	public List<Media> getMedia(String name) {
		List<Media> mediaList = new ArrayList<Media>();
		try {
			begin();
            Criteria crit = getSession().createCriteria(Media.class);
			crit.add(Restrictions.eq("name", name));
			mediaList = crit.list();
            commit();
			return mediaList;
		} catch(HibernateException e) {
			System.out.println("Error getting media"+e);
			return null;
		}
	}

	public List<Media> getAllMedia() {
		List<Media> mediaList = new ArrayList<Media>();
		try {
			begin();
			Criteria crit = getSession().createCriteria(Media.class);
			mediaList = crit.list();
            commit();
			return mediaList;
		} catch(HibernateException e) {
			System.out.println("Error getting media"+e);
			return null;
		}
	}

	public void deleteMedia(Media media) {
		try {
			begin();
			getSession().delete(media);
			commit();
	
		} catch(HibernateException e) {
			rollback();
			System.out.println("Media couldn't be deleted from the database"+e);
		}
	}

	public void updateMedia(Media media) {
		try {
			begin();
			getSession().update(media);
			commit();
	
		} catch(HibernateException e) {
			rollback();
			System.out.println("Media couldn't be deleted from the database"+e);
		}
	}

}
