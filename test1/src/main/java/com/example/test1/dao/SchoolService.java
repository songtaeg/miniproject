package com.example.test1.dao;

import java.util.HashMap;

public interface SchoolService {
	//조회
	HashMap<String, Object> searchStuList (HashMap<String, Object> map);
	
	//상세정보
	HashMap<String, Object> searchDetail (HashMap<String, Object> map);
	
	HashMap<String,Object> addStu (HashMap<String, Object> map);
}
	
	
	
	
	
	
	
	
	
	
