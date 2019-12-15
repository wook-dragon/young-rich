package com.dto;

import java.sql.Date;

public class Member {
	private String userid;
	private String nickname;
	private String pwd;
	private String birthdate;
	private String gender;
	private int usercode;
	
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}
	
	
	public String getUserid() {
		return userid;
	}
	public String getNickname() {
		return nickname;
	}
	public String getPwd() {
		return pwd;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public String getGender() {
		return gender;
	}
	public int getUsercode() {
		return usercode;
	}
	@Override
	public String toString() {
		return "Member [userid=" + userid + ", nickname=" + nickname + ", pwd=" + pwd + ", birthdate=" + birthdate
				+ ", gender=" + gender + ", usercode=" + usercode + "]";
	}
	
	
	
}
