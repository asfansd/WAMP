package com.me.wamp.pojo;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="artist")
public class Artist {
	
	@Id
	@Column(name="artistid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int artistid;
	
	@Basic
	@Column(name="name")
	private String name;
	
	public Artist() {
		
	}
	
	public int getArtistid() {
		return artistid;
	}
	public void setArtistid(int artistid) {
		this.artistid = artistid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
