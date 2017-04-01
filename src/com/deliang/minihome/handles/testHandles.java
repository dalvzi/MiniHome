package com.deliang.minihome.handles;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testHandles {

	@RequestMapping("test")
	public String test() {
		return "test";
	}
	
}
