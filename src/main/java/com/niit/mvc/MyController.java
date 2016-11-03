package com.niit.mvc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class MyController {
	@Autowired
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView helloWorld(){
		ModelAndView model = new ModelAndView("index");
		return model;
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam(value="error",required=false) String error,
			@RequestParam(value="logout",required=false) String logout, 
			Model model){
			if(error!=null)
		model.addAttribute("error","Invalid username and password");
		
		if(logout!=null)
			model.addAttribute("logout","You have logged out successfully");
		return "login";
	}
	@RequestMapping("/contact")
	public ModelAndView contact(){
			
		ModelAndView model = new ModelAndView("contactus");

		return model;
	}
	@RequestMapping("/email")
	public ModelAndView abtus(){
			
		ModelAndView model = new ModelAndView("email");

		return model;
	}
}
