package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	//중복 체크,사용자 상세 정보
	HashMap<String, Object> searchUserInfo(HashMap<String, Object> map);
	
	//사용자 목록
	HashMap<String, Object> searchUserList(HashMap<String, Object> map);
	
	//게시글 목록
	HashMap<String, Object> searchBoardList(HashMap<String, Object> map);
	
	//사용자 삭제
	HashMap<String, Object> deleteUser(HashMap<String, Object> map);
}
