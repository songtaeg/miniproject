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

import com.example.test1.dao.AreaService;
import com.google.gson.Gson;

@Controller
public class AreaController {
	@Autowired
	AreaService areaService;
	
	@RequestMapping("/area.do") 
    public String area(Model model) throws Exception{

        return "/area";
    }
	
	@RequestMapping("/addr.do") 
	public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/jusoPopup";
	}
	

	
	@RequestMapping(value = "/area.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String Area(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = areaService.searchArea(map);
		
		return new Gson().toJson(resultMap);
	}
}
