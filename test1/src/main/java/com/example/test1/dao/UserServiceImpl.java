package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Board;
import com.example.test1.model.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	HttpSession session;
	
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

	@Override
	public HashMap<String, Object> loginUser(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap =new HashMap<String, Object>();
		try {
			User user=userMapper.loginUser(map);
			//System.out.println(user);
			if(user==null) {
				resultMap.put("result", "fail");
				User idCheck=userMapper.selectUserInfo(map);
				//System.out.println(idCheck);
				if(idCheck == null) {
					resultMap.put("message", "없는 아이디");
				}else {
					resultMap.put("message", "비밀번호 다시 확인");
				}
				//resultMap.put("message", "id/pwd 확인");
			}
			else {
				resultMap.put("result", "success");
				resultMap.put("message", "로그인 성공");
				session.setAttribute("sessionId", user.getUserId());
				session.setAttribute("sessionName", user.getUserName());
				session.setAttribute("sessionStatus", user.getStatus());
				session.setAttribute("sessionEmail", user.getEmail());
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception : " + e);
			resultMap.put("result", "fail");
			resultMap.put("message", "문제 발생");
		}
		return resultMap;
	}
	
}
