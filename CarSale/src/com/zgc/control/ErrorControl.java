package com.zgc.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorControl {

	@RequestMapping("/error.html")
	public String error(){
		return "error";
	}
}
