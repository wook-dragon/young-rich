package com.dto;

public class WatchList {
	private int seq;
	private String mypicsrc;
	private String content;
	private int issecret; //? 
	private String adddate;
	private String servdate;
	//private int recommend; //좋아?��: count ?��?�� 
	private String title;
	private String userid;
	private String nickname;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getMypicsrc() {
		return mypicsrc;
	}
	public void setMypicsrc(String mypicsrc) {
		this.mypicsrc = mypicsrc;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIssecret() {
		return issecret;
	}
	public void setIssecret(int issecret) {
		this.issecret = issecret;
	}
	public String getAdddate() {
		return adddate;
	}
	public void setAdddate(String adddate) {
		this.adddate = adddate;
	}
	public String getServdate() {
		return servdate;
	}
	public void setServdate(String servdate) {
		this.servdate = servdate;
	}
//	public int getRecommend() {
//		return recommend;
//	}
//	public void setRecommend(int recommend) {
//		this.recommend = recommend;
//	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "WatchList [seq=" + seq + ", mypicsrc=" + mypicsrc + ", content=" + content + ", issecret=" + issecret
				+ ", adddate=" + adddate + ", servdate=" + servdate +  "title=" + title
				+ ", userid=" + userid + ", nickname=" + nickname + "]";
	}
	
	
	
	
	
}
