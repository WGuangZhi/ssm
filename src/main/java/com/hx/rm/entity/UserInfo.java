package com.hx.rm.entity;

import java.io.Serializable;

public class UserInfo implements Serializable{
	private int uid;
	private String imageurl;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	@Override
	public String toString() {
		return "UserInfo [uid=" + uid + ", imageurl=" + imageurl + "]";
	}
}
