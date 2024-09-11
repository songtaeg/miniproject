package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Area;
import com.example.test1.model.Board;
import com.example.test1.model.Chart;
import com.example.test1.model.Item;

@Mapper
public interface AreaMapper {
	List<Area> selectSiList(HashMap<String, Object> map);
	
	List<Area> selectGuList(HashMap<String, Object> map);

	List<Area> selectDongList(HashMap<String, Object> map);
	
	List<Area> siList(HashMap<String, Object> map);
	List<Area> guList(HashMap<String, Object> map);
	List<Area> dongList(HashMap<String, Object> map);
	
	List<Area> selectNxNy(HashMap<String, Object> map);
}