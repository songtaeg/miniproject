package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.User;

@Mapper
public interface UserMapper {
	User selectUserInfo(HashMap<String, Object> map);
	
	List<User> selectUserList(HashMap<String, Object> map);
	
	List<Board> selectBoardList(HashMap<String, Object> map);
	
	void deleteUser(HashMap<String, Object> map);
}
