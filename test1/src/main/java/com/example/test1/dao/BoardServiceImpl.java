package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public HashMap<String, Object> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		//System.out.println(map);
		HashMap<String, Object> resultMap = 
				new HashMap<String, Object>();
		List<Board> list = boardMapper.selectBoardList(map);
		int count=boardMapper.CountBoardList(map);
		
		resultMap.put("list", list);
		resultMap.put("count", count);
		resultMap.put("result", "success");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =
				new HashMap<String, Object>();
		try {
			boardMapper.deleteBoard(map);
			resultMap.put("message", "삭제되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("message", "예기치 못한 문제가 발생했습니다. \n나중에 다시 시도해주세요.");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =
				new HashMap<String, Object>();
		try {
			System.out.println(map);
			boardMapper.insertBoard(map);
			System.out.println(map);
			resultMap.put("idx", map.get("boardNo"));
			resultMap.put("result", "success");
			resultMap.put("message", "등록되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다. \n나중에 다시 시도해주세요.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =
				new HashMap<String, Object>();
		//System.out.println(map);
		try {
			System.out.println(map);
			Board board= boardMapper.selectBoardInfo(map);
			System.out.println(map);
			//List<Board> commentList = boardMapper.selectComment(map);
			//resultMap.put("commentList", commentList);
			resultMap.put("info", board);
		
			resultMap.put("result", "success");
			resultMap.put("message", "검색되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다. \n나중에 다시 시도해주세요.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addBoardFile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.insertBoardFile(map);
		
		return null;
	}

	@Override
	public HashMap<String, Object> removeCheckBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =
				new HashMap<String, Object>();
		try {
			boardMapper.deleteCheckBoard(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}


	
}
