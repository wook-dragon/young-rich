package com.dto;

import java.sql.Timestamp;

public class Freeboard {
	private int seq; //�?번호
	private String userid; // ?��?��?��
	private String title; // �??���?
	private String content; // �??��?��
	private int hits; // 조회?��
	private Timestamp logtime; // ?��?��?��
	
	private int refer;			// 참조 �? 번호
	private int depth;			// �? 깊이? 뭐임 ?��거는?
	private int step;			// �? ?���?
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public Timestamp getLogtime() {
		return logtime;
	}
	public void setLogtime(Timestamp logtime) {
		this.logtime = logtime;
	}
	public int getRefer() {
		return refer;
	}
	public void setRefer(int refer) {
		this.refer = refer;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	@Override
	public String toString() {
		return "Freeboard [seq=" + seq + ", userid=" + userid + ", title=" + title + ", content=" + content + ", hits="
				+ hits + ", logtime=" + logtime + ", refer=" + refer + ", depth=" + depth + ", step=" + step + "]";
	}
	

	
}
