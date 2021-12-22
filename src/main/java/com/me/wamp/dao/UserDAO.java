package com.me.wamp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import com.me.wamp.pojo.User;

public class UserDAO extends DAO {
	public void createUser(User user) {
        try {
            begin();
            getSession().save(user);
            commit();
            System.out.println("User saved in the DataBase");
        } catch (Exception e) {
            rollback();
            System.out.println("User couldn't be  saved in the DataBase");
        }
    }
    
    public User getUserById(int userid) {
        try {
    		return getSession().get(User.class, userid);
        } catch(HibernateException e) {
        	return null;
        }
    }
	
	public User getUser(User user) {
		try {
			begin();
            Criteria crit = getSession().createCriteria(User.class);
            crit.add(Restrictions.eq("username", user.getUsername()));
            crit.add(Restrictions.eq("password", user.getPassword()));
            User loggedInUser = (User) crit.uniqueResult();
			commit();
            return loggedInUser;
		} catch(HibernateException e) {
			rollback();
			System.out.println("Couldn't get the user." + user.getUsername());
			return null;
		}
	}
    
    public List<User> getAllUsers() {
    	try {
    		begin();
    		Query q = getSession().createQuery("from User where role = :user");
            q.setString("user", "user");
            List<User> userList = q.getResultList();
    		commit();
    		return userList;
    	} catch(HibernateException e) {
			return null;
		}
    }

    public void deleteUser(User user) {
    	try {
	    	begin();
	        getSession().delete(user);
	        commit();
	    } catch (HibernateException e) {
	    	rollback();
	    	System.out.println("Couldn't delete the user.");
	    }
    }
    
    public void updateUser(User user) {
    	try {
	    	begin();
	        getSession().update(user);
	        commit();
	    } catch (HibernateException e) {
	    	rollback();
	    	System.out.println("Couldn't update the user.");
	    }
    }

	public User getUserByUsername(String username) {
		try {
			begin();
            Query q = getSession().createQuery("from User where username = :username");
            q.setString("username", username);
            User user = (User) q.uniqueResult();
            commit();
            return user;
		} catch(HibernateException e) {
			rollback();
			return null;
		}
	}   
}