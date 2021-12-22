package com.me.wamp.pojo;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name = "files")
public class File {
	
	@Id
	@Column(name="fileid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int fileid;
	
	@Basic
	@Column(name="name")
    private String name;
	
	@Column(name="data")
    private byte[] data;

	public int getFileid() {
		return fileid;
	}

	public void setFileid(int fileid) {
		this.fileid = fileid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}
}