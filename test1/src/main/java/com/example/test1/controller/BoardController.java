package com.example.test1.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.BoardService;
import com.google.gson.Gson;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	// 게시글 목록 페이지
	@RequestMapping("/board-list.do") 
    public String boardList(Model model) throws Exception{

        return "/board-list";
    }
	
	// 게시글 작성
	@RequestMapping("/board-insert.do") 
    public String boardInsert(Model model) throws Exception{

        return "/board-insert";
    }
	
	//게시글 보기
	@RequestMapping("/board-view.do") 
    public String boardView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		System.out.println(map);
		request.setAttribute("boardNo", map.get("boardNo"));
        return "/board-view";
    }
	
	@RequestMapping(value = "/board-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_list(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = boardService.searchBoardList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/board-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = boardService.removeBoard(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/board-add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = boardService.addBoard(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/board-view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_view(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = boardService.searchBoardInfo(map);
		
		return new Gson().toJson(resultMap);
	}
}
