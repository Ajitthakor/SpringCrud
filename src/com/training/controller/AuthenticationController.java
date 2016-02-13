package com.training.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuthenticationController {
	
	@RequestMapping(value="/login_secure", method = RequestMethod.GET)
	public String executeSecurity(ModelMap model, Principal principal ) {
		
		//ModelAndView mv=new ModelAndView("/spring_sec_login");
		return "spring_sec_login";
 
	}
	@RequestMapping(value="/ajit", method = RequestMethod.GET)
	public String admin(ModelMap model, Principal principal ) {
 
		String name = principal.getName();
		model.addAttribute("author", name);
		model.addAttribute("message", "Welcome To Login Form Based Spring Security Example!!!");
		return "redirect:login";
 
	}
	@RequestMapping(value="/fail2login", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";
 
	}

}
