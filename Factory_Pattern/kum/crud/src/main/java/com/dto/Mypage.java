package com.dto;

public class Mypage {
	private int watchCount;
	private String updateTime;
	
	
	public int getWatchCount() {
		return watchCount;
	}
	public void setWatchCount(int watchCount) {
		this.watchCount = watchCount;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	@Override
	public String toString() {
		return "Mypage [watchCount=" + watchCount + ", updateTime=" + updateTime + "]";
	}
	
	
	
}
