package com.hx.rm.entity;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

public class Permission implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private int parentId;
	private String name;
	private String url;
	private String icon;
	private int sort;
	private int type;
	private List<Permission> subs;
	
	public Permission() {
	}

	public Permission(Integer id, int parentId, String name, String url, String icon, int sort, int type,
			List<Permission> subs) {
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.url = url;
		this.icon = icon;
		this.sort = sort;
		this.type = type;
		this.subs = subs;
	}
	
	public int getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
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

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public List<Permission> getSubs() {
		return subs;
	}

	public void setSubs(List<Permission> subs) {
		this.subs = subs;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Permission [id=" + id + ", parentId=" + parentId + ", name=" + name + ", url=" + url + ", icon=" + icon
				+ ", sort=" + sort + ", type=" + type + ", subs=" + subs + "]";
	}
}
