package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ChartMapper;
import com.example.test1.model.Chart;

@Service
public class ChartServiceImpl implements ChartService{
	@Autowired
	ChartMapper chartMapper;
	
	@Override
	public HashMap<String, Object> searchChart(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Chart> list=chartMapper.selectChart(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

}
