package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;

@Mapper
public interface BoardMapper {
	List<Board> selectBoardList(HashMap<String, Object> map);
	
	// 게시글 삭제
	void deleteBoard(HashMap<String, Object> map);
	
	// 게시글 등록
	void insertBoard(HashMap<String, Object> map);
	
	//게시글 상세보기
	Board selectBoardInfo(HashMap<String, Object> map);
	
	//게시글 전체 갯수
	int CountBoardList(HashMap<String, Object> map);
	
	List<Board> selectComment(HashMap<String, Object> map);
}