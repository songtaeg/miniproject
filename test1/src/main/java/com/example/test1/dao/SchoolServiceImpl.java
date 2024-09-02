package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.SchoolMapper;
import com.example.test1.model.School;

@Service
public class SchoolServiceImpl implements SchoolService{
	@Autowired
	SchoolMapper schoolMapper;

	@Override
	public HashMap<String, Object> searchStuList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<School> list= schoolMapper.selectStuList(map);
		int count=schoolMapper.CountStuList(map);
		
		resultMap.put("list", list);
		resultMap.put("count", count);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchDetail(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		School school =schoolMapper.detailStuList(map);
		resultMap.put("info", school);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addStu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			schoolMapper.insertStu(map);
			resultMap.put("result", "success");
			resultMap.put("message", "등록되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다. \n나중에 다시 시도해주세요.");
		}
		return resultMap;
	}

}
