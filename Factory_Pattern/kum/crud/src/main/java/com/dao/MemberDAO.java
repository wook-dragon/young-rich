package com.dao;

import java.util.List;

import com.dto.Member;

public interface MemberDAO {
	
	void Insert(Member member);
	
	Member Detail(Integer usercode);
	
	void Edit(Member member);
	
	void Delete(Integer usercode);
		
	List<Member> list();
}
