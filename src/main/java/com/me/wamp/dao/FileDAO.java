package com.me.wamp.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.springframework.context.annotation.Bean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.me.wamp.pojo.File;

public class FileDAO extends DAO {
	public int createFile(File file) {
        try {
            begin();
            int fileid = (Integer) getSession().save(file);
            commit();
            return fileid;
        } catch (Exception e) {
            rollback();
        }
        System.out.println("File saved in the DataBase");
        return 0;
    }
    
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver getCommonsMultipartResolver() {
	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	    multipartResolver.setMaxUploadSize(20971520);   // 20MB
	    multipartResolver.setMaxInMemorySize(1048576);  // 1MB
	    return multipartResolver;
	}
	
    public File getFile(int fileid) {
        try {
        	return getSession().get(File.class, fileid);
        } catch (HibernateException e) {
        	return null;
        }
    }
    
    public List<File> getAllFiles() {
    	List<File> fileList = new ArrayList<File>();
    	try {
    		begin();
            Criteria crit = getSession().createCriteria(File.class);
            fileList = crit.list();
            commit();
    		return fileList;
    	} catch(HibernateException e) {
    		return null;
    	}
    }

    public void deleteFile(File file) {
        try {
	    	begin();
	        getSession().delete(file);
	        commit();
    		System.out.println("Deleted File");
        } catch(HibernateException e) {
        	rollback();
    		System.out.println("Couldn't delete File");
        }
    }
    
    public void updateFile(File file) {
    	try {
	    	begin();
	        getSession().update(file);
	        commit();
    		System.out.println("Updated File");
    	} catch(HibernateException e) {
    		rollback();
    		System.out.println("Couldn't update File");
    	}
    }
    
}
