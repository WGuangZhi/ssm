package com.hx.rm.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

public class Role implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String description;
	private List<Permission>  pers;//与数据库一对一的关系用一个对象实例，如果用一对多的话，那就是list对象
	
	public Role() {
	}

	public Role(int id, String name, String description, List<Permission> pers) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.pers = pers;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Permission> getPers() {
		return pers;
	}

	public void setPers(List<Permission> pers) {
		this.pers = pers;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", description=" + description + ", pers=" + pers + "]";
	}
}
