package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.ItemService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class ItemController {
	@Autowired
	ItemService itemService;
	
	@RequestMapping("/item.do") 
    public String main(Model model) throws Exception{

        return "/item-list";
    }
	
	@RequestMapping("/weather.do") 
    public String main2(Model model) throws Exception{

        return "/weather";
    }
	
	@RequestMapping(value = "/item.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String Item(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		if(map.containsKey("selectItem")) {
			String json = map.get("selectItem").toString(); 
			ObjectMapper mapper = new ObjectMapper();
			List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
			map.put("list", list);
		}
		resultMap=itemService.searchItem(map);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/code-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String Code(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		
		resultMap = itemService.searchCode(map);
		
		return new Gson().toJson(resultMap);
	}
}
