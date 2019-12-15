package com.dto;

import java.sql.Timestamp;

public class FreeboardReply {
	private int no;
	private String reply_content;
	private Timestamp writedate;
	private String userid;
	private int seq;
	
	
	
	public void setNo(int no) {
		this.no = no;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
	public int getNo() {
		return no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public String getUserid() {
		return userid;
	}
	public int getSeq() {
		return seq;
	}
	@Override
	public String toString() {
		return "FreeboardReply [no=" + no + ", reply_content=" + reply_content + ", writedate=" + writedate
				+ ", userid=" + userid + ", seq=" + seq + "]";
	}
	public Timestamp getWritedate() {
		return writedate;
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	} 
	
	
	
	
	
}
