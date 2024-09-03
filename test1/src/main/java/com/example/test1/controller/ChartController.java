package com.example.test1.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.ChartService;
import com.google.gson.Gson;

@Controller
public class ChartController {
	
	@Autowired
	ChartService chartService;
	
	@RequestMapping("/chart.do") 
    public String chart(Model model) throws Exception{

        return "/chart";
    }
	
	@RequestMapping("/pay.do") 
    public String pay(Model model) throws Exception{

        return "/pay";
    }
	
	@RequestMapping(value = "/chart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String Chart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		resultMap = chartService.searchChart(map);
		
		return new Gson().toJson(resultMap);
	}
}
