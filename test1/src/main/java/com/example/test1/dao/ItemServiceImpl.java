package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ItemMapper;
import com.example.test1.model.Code;
import com.example.test1.model.Item;

@Service
public class ItemServiceImpl implements ItemService{
	
	@Autowired
	ItemMapper itemMapper;

	@Override
	public HashMap<String, Object> searchItem(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Item> list =itemMapper.selectItem(map);
		
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchCode(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Code> codeList=itemMapper.selectCodeList(map);
		
		resultMap.put("codeList", codeList);
		
		return resultMap;
	}

}
