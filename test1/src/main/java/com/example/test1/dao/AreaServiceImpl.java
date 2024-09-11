package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.AreaMapper;
import com.example.test1.model.Area;

@Service
public class AreaServiceImpl implements AreaService{
	@Autowired
	AreaMapper areaMapper;

	@Override
	public HashMap<String, Object> searchArea(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Area> list=null;
		try {
			if(!map.get("si").equals("") ) {
				list =areaMapper.selectGuList(map);
				
				if(!map.get("gu").equals("")) {
					list=areaMapper.selectDongList(map);
				}
			}
			else {
				list =areaMapper.selectSiList(map);
			}
			resultMap.put("list", list);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchsiList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Area> siList=areaMapper.siList(map);
		resultMap.put("siList", siList);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchguList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Area> guList=areaMapper.guList(map);
		resultMap.put("guList", guList);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchdongList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Area> dongList=areaMapper.dongList(map);
		resultMap.put("dongList", dongList);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchNxNy(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Area> nxnyList=areaMapper.selectNxNy(map);
		resultMap.put("nxnyList", nxnyList);
		return resultMap;
	}
}
