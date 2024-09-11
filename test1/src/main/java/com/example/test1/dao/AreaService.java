package com.example.test1.dao;

import java.util.HashMap;

public interface AreaService {
	HashMap<String, Object> searchArea(HashMap<String, Object> map);
	
	HashMap<String, Object> searchsiList(HashMap<String, Object> map);
	HashMap<String, Object> searchguList(HashMap<String, Object> map);
	HashMap<String, Object> searchdongList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchNxNy(HashMap<String, Object> map);

}
