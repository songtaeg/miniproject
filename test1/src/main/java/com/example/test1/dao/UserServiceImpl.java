package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Board;
import com.example.test1.model.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;
	
	@Override
	public HashMap<String, Object> searchUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap
			=new HashMap<String, Object>();
		
		try {
			System.out.println(map);
			User user = userMapper.selectUserInfo(map);
			resultMap.put("info", user);
			resultMap.put("result", "success");
			resultMap.put("message", "조회");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "문제 발생");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchUserList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =
				new HashMap<String, Object>();
		try {
			System.out.println(map);
			List<User> list = userMapper.selectUserList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}

		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =
				new HashMap<String, Object>();
		try {
			List<Board> list = userMapper.selectBoardList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
			
		} catch (Exception e) {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> deleteUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap
			=new HashMap<String, Object>();
		try {
			userMapper.deleteUser(map);
			resultMap.put("message", "success");
		} catch (Exception e) {
			resultMap.put("message", "fail");
		}
		return resultMap;
	}
	
}
