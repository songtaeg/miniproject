package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.School;

@Mapper
public interface SchoolMapper {
	
	List<School> selectStuList(HashMap<String, Object> map);
	
	School detailStuList(HashMap<String, Object> map);
	
	void insertStu(HashMap<String, Object> map);

}
