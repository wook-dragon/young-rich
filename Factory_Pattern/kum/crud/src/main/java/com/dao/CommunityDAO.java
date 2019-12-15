package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.dto.Freeboard;
import com.dto.FreeboardReply;
import com.dto.Member;

public interface CommunityDAO {

	public ArrayList<Freeboard> getBoardList(int start, int last, int type);

	// QNA 게시?�� ?��?��?��?�� 모두 출력, ?���? ?��?��?��?�� ?��?��?�� ?���?�? ?���?�? 출력
	public ArrayList<Freeboard> getQnaBoardList (int start, int last, int usercode, String userid);
		
	

	// 게시?�� 처음 출력?��?�� seq 추출
	public int getStartSeq(int type);


	// 게시?�� �? 게시�? ?�� 반
	public int getTotalBoardCount(int type) ;


	// 게시�? ?��?��
	public void insertBoard(Freeboard freeboard, int type) ;


	public int maxDepthSeq(int seq) ;


	// qna 게시�? ?��?�
	public void insertQnaBoardRw0(Freeboard freeboard, int type) ;


	// STEP 증�
	public void stepUp(int refer, int depth) ;

	// qna ?���? 게시�? ?��?��
	public void insertQnaBoardRw1(Freeboard freeboard, int type, int refer) ;
	

	// 게시�? ?��?��
	public int updateBoard(Freeboard freeboard, int type, int seq) ;

	// 게시�? ?��?��
	public int deleteBoard(int seq, int type) ;

	// 게시�? �? 카운?�� 증�?
	public void increaseViewCount(int seq, int type) ;


	// ?���? 조회 추후 ?��?�� (userid 말고 nickname ?���? 보려�? 조인?�� ?��?��?��?��?���??)
	public ArrayList<FreeboardReply> getBoardReply(int seq) ;


	
	// ?���? 개수 추출 막상 만들?��?��?�� ?��?��?�� 굉장?�� ?��?���?. ?��중에 ?��?�� 게시�? 조회 기능?��?�� ?��치는걸로.. ?��거는 ?��?��?��?���? ?��?��?��기에?��
	
	public int getReplyCount(int seq) ;

	// ?���? ?��?�� ?��리보?���? ?��?�� ?��?��것이?��?�� ?���? TYPE ?���? ?��빼겠?��?��?��.
	public int insertReply(FreeboardReply fbreply) ;


	// ?���? ?��?�� XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ?��?��?��
	public int updateReply(FreeboardReply fbreply) ;


	// ?���? ?��?��
	public void deleteReply(int no) ;


	// Search

	// 게사?�� �? 번호�? ?��?��
	public ArrayList<Freeboard> getBoardListByBoardNum(int seq, int type);


	// ?��목으�? �??��
	public ArrayList<Freeboard> getBoardListByBoardTitle(String title, int type) ;

	// ?��목이 ?��치하?�� ?���? 게시�? ?�� 반환
	public int getBoardCountByBoardTitle(String title, int type) ;


	// ?��?��?���? �??��
	public ArrayList<Freeboard> getBoardListByBoardContent(String content, int type) ;


	// ?��?��?�� ?��치하?�� ?���? 게시�? ?�� 반환
	public int getBoardCountByBoardContent(String content, int type) ;

	// ?��?��?��(nickname) ?���? �??��
	public ArrayList<Freeboard> getBoardListByBoardWrtier(String writer, int type); 


	// ?��?��?���? ?��치하?�� ?���? 게시�? ?�� 반환
	public int getBoardCountByBoardWriter(String writer, int type); 

}
