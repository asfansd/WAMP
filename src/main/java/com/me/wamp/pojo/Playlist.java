package com.me.wamp.pojo;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="playlist")
public class Playlist {
	
	@Id
	@Column(name="playlistid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int playlistid;
	
	@Basic
	@Column(name="name")
	private String name;
	
	@Basic
	@Column(name="type")
	private String type;
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name="Playlist_Media")
	private List<Media> medialist = new ArrayList<Media>();
	
	public Playlist() {
		
	}
	
	public int getPlaylistid() {
		return playlistid;
	}
	public void setPlaylistid(int playlistid) {
		this.playlistid = playlistid;
	}
		
	public List<Media> getMedialist() {
		return medialist;
	}

	public void setMedialist(List<Media> medialist) {
		this.medialist = medialist;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public Media getMedia(int mediaid) {
		for(Media m : this.medialist) {
			if(m.getMediaid()==mediaid) {
				return m;
			}
		}
		return null;
	}
	
	public List<Media> getMediaByName(String mediaName) {
		List<Media> list = new ArrayList<Media>();
		for(Media m : this.medialist) {
			if(m.getName() == mediaName) {
				list.add(m);
			}
		}
		return list;
	}
	
	public Media getMedia(Media media) {
		for(Media m : this.medialist) {
			if(m.equals(media)) {
				return(m);
			}
		}
		return null;
	}
	
	public void addMedia(Media media) {
		List<Media> list = this.getMedialist();
		list.add(media);
		this.setMedialist(list);
	}
	
	public void removeMediaById(int mediaid) {
		List<Media> list = this.getMedialist();
		List<Media> deletedList = new ArrayList<Media>();
		for(Media m : list) {
			if(m.getMediaid()==mediaid) {
				deletedList.add(m);
				break;
			}
		}
		list.removeAll(deletedList);
		this.setMedialist(list);
	}
	
	public void removeMedia(Media media) {
		List<Media> list = this.getMedialist();
		list.remove(media);
		this.setMedialist(list);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
