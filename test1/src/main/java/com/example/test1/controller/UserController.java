package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/login.do") 
    public String login(Model model) throws Exception{

        return "/login";
    }
	
	@RequestMapping("/join.do") 
    public String join(Model model) throws Exception{

        return "/join";
    }
	
	@RequestMapping("/user-list.do") 
    public String userList(Model model) throws Exception{

        return "/user-list";
    }
	
	@RequestMapping("/board.do") 
    public String board(Model model) throws Exception{

        return "/board";
    }
	
	@RequestMapping("/delete.do") 
    public String delete(Model model) throws Exception{

        return "/delete";
    }
	
	@RequestMapping("/user-view.do") 
    public String userView(HttpServletRequest request, Model model,@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("userId", map.get("userId"));
        return "/user-view";
    }
	
	@RequestMapping(value = "/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = userService.deleteUser(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/idCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = userService.searchUserInfo(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/user-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = userService.searchUserList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/board.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String Board(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = userService.searchBoardList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/user-view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_view(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = userService.searchUserInfo(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = userService.loginUser(map);
		
		return new Gson().toJson(resultMap);
	}
}
