package com.example.test1.dao;

import java.util.HashMap;

public interface ItemService {
	HashMap<String,Object> searchItem(HashMap<String,Object> map);
	
	HashMap<String,Object> searchCode(HashMap<String,Object> map);
}
