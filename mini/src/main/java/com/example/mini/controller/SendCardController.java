package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SendCardController {

	
	@RequestMapping("/sendcard.do") 
    public String mainPage(Model model) throws Exception{
        return "/myInfo_gift1_send";
    }
	
}