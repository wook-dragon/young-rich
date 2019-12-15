package com.dto;

//좋아?�� dto : 같�? userid 중복 막기 

public class LikeDTO {
	String userid;
	int seq; //�?번호 
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	@Override
	public String toString() {
		return "LikeDTO [userid=" + userid + ", seq=" + seq + "]";
	}
	
}


