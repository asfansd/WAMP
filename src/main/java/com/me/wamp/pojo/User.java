package com.me.wamp.pojo;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	
	@Id
	@Column(name="userid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userid;
	
	@Basic
	@Column(name="username")
	private String username;
	
	@Basic
	@Column(name="password")
	private String password;
	
	@Basic
	@Column(name="role")
	private String role;
	
	@OneToOne
	@JoinColumn(name = "playlist_id")
	private Playlist playlist;
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Playlist getPlaylist() {
		return playlist;
	}
	public void setPlaylist(Playlist playlist) {
		this.playlist = playlist;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getUserid() {
		return userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}
