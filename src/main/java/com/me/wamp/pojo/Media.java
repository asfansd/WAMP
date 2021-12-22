package com.me.wamp.pojo;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ForeignKey;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="media")
public class Media {
	
	@Id
	@Column(name="mediaid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int mediaid;
	
	@Basic
	@Column(name="type")
	private String type;
	
	@Basic
	@Column(name="name")
	private String name;
	
	@Basic
	@Column(name="url")
	private String url;
	
	@ManyToOne
	@JoinColumn(name = "artist_id",
			foreignKey = @ForeignKey(name = "ARTIST_ID_FK")
	)
	private Artist artist;
	
	public Media() {
		
	}
	
	public int getMediaid() {
		return mediaid;
	}
	public void setMediaid(int mediaid) {
		this.mediaid = mediaid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Artist getArtist() {
		return artist;
	}
	public void setArtist(Artist artist) {
		this.artist = artist;
	}
	 
}
