package com.dao;

import java.util.ArrayList;

import com.dto.WatchList;

public interface WatchListDAO {

	
	//?��?��-?��치리?��?�� - 불러?���? -?��?��
	public ArrayList<WatchList> WatchIdCheck(String userid);

	
	// ?��?��-?��치리?��?��-불러?���?-?��
	


//?��?��-공유리스?��-?��?��

public ArrayList<WatchList> sharelist();


//?��?�� ?��?��?��?���? 조회 
public ArrayList<WatchList> getNickName(String nickname);


//?��치리?��?��추�?
public boolean addWatchList(WatchList watchlist);


	
}	

