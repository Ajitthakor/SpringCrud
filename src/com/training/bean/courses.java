package com.training.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;

import org.codehaus.jackson.annotate.JsonManagedReference;

@Entity(name = "courses")
public class courses {
	@Id
	@GeneratedValue
	private int cid;
	private String courseName;
	private String duration;

	// RelationShip
	@JsonManagedReference
	@ManyToMany
	@JoinColumn(name = "uid")
	private List<user> user = new ArrayList<user>();

	public courses(int cid, String courseName, String duration) {
		this.cid = cid;
		this.courseName = courseName;
		this.duration = duration;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public List<user> getUser() {
		return user;
	}

	public void setUser(List<user> user) {
		this.user = user;
	}

}
