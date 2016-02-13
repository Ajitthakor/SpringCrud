package com.training.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.codehaus.jackson.annotate.JsonManagedReference;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity(name = "user")
public class user {

	@Id
	@GeneratedValue
	private int uid;

	@NotEmpty(message = "Enter User Name..!")
	private String uname;
	private String role;
	private String country;
	private String state;

	@NotEmpty(message = "Enter City Name..!")
	private String city;

	@NotEmpty(message = "Enter Pincode..!")
	@Length(max = 6)
	private String pinCode;

	@NotEmpty(message = "Enter Email Address..!")
	@Email
	@Column(unique = true)
	private String email;

	@NotEmpty(message = "Enter Valid Password..!")
	private String password;

	@NotEmpty(message = "Enter MobileNumber..!")
	@Length(max = 10)
	private String mobileNumber;
	private CommonsMultipartFile myfile;

	// RelationShip..
	/*
	 * @ManyToMany(mappedBy="usertable") private List<courses>course;
	 */

	@JsonManagedReference
	@ManyToMany(mappedBy = "user")
	private List<courses> course = new ArrayList<courses>();

	public List<courses> getCourse() {
		return course;
	}

	public void setCourse(List<courses> course) {
		this.course = course;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public CommonsMultipartFile getMyfile() {
		return myfile;
	}

	public void setMyfile(CommonsMultipartFile myfile) {
		this.myfile = myfile;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
