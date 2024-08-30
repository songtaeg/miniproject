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
import com.example.test1.dao.SchoolService;
import com.google.gson.Gson;

@Controller
public class SchoolController {

	@Autowired
	SchoolService schoolservice;
	
	// 게시글 목록 페이지
	@RequestMapping("/school-stu.do") 
    public String schoolList(Model model) throws Exception{

        return "/school-list";
    }
	
	//학생 상세정보
	@RequestMapping("/school-stuView.do") 
    public String schoolViewList(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("stuNo", map.get("stuNo"));
        return "/school-stuView";
    }

	@RequestMapping(value = "/school-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String school_list(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = schoolservice.searchStuList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/school-stuView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String schoolViewList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = schoolservice.searchDetail(map);
		
		return new Gson().toJson(resultMap);
	}
}
