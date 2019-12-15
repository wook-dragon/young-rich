package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.dto.Freeboard;
import com.dto.FreeboardReply;
import com.dto.LikeDTO;
import com.dto.Member;

public interface LikeDAO {
	public int likeDAO(String userid, int seq) ;

	
	//좋아?�� 취소
	public int deleteLike(String userid, int seq) ;

	
	//?��?�� : 좋아?�� ?���? 조회 
	public ArrayList<LikeDTO> likeSearch(String userid);

	
	public boolean checkLikeService(String userid, int seq);

}
