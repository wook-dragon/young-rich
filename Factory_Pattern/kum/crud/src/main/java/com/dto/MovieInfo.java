package com.dto;


public class MovieInfo {
	private int seq; // ?��?��번호
	private String image;
	private String title;
	private String pubdate;
	private String dirname;
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public void setDirname(String dirname) {
		this.dirname = dirname;
	}
	public int getSeq() {
		return seq;
	}

	public String getTitle() {
		return title;
	}
	public String getPubdate() {
		return pubdate;
	}
	public String getDirname() {
		return dirname;
	}
	@Override
	public String toString() {
		return "MovieInfo [seq=" + seq + ", image=" + image + ", title=" + title + ", pubdate=" + pubdate + ", dirname="
				+ dirname + "]";
	}
	
	
	
}
