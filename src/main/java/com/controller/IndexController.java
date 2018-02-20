package com.controller;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.CategoryDao;
import com.Dao.SupplierDao;
import com.Dao.UserDao;
import com.DaoImpl.UserDaoImpl;
import com.Model.Category;
import com.Model.Product;
import com.Model.Supplier;
import com.Model.User;

@Controller
public class IndexController {

	@Autowired
	UserDao userDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	SupplierDao	supplierDao;
	//index page controller with pre populated categorylist in menu 
	@RequestMapping(value ={"/","/index"} ,method=RequestMethod.GET)
	public String index(Model model){
		List<Category> listCat = categoryDao.showallCatList();
		model.addAttribute("catList",listCat);
			
		return "index";
	}
	//user signup page return object to give path in spring form 
	@RequestMapping(value="/authSignUp",method=RequestMethod.GET)
	public String SignUp(Model model)
	{
		model.addAttribute("user", new User());
		return "SignUp";
		
	}
	@RequestMapping(value="/error",method=RequestMethod.GET)
	public ModelAndView accesssDenied(Principal user) {

		ModelAndView model = new ModelAndView();
		String path = "/AntiqueGalleryFrontEnd/index";
		if (user != null) {
			model.addObject("msg", "Hi " + user.getName()
			+ ", you do not have permission to access this page! click here for<a href="+path+" >Continue Shopping</a>");
		} else {
			model.addObject("msg",
			"you do not have permission to access this page! click here for<a href="+path+" >Continue Shopping</a>");
		}

		model.setViewName("403");
		return model;

	}
	//show product admin's page
	@RequestMapping(value="/ShowProduct",method=RequestMethod.POST)
	public String productShowdata()
	{
		
		return "ShowProduct";
	}
	//about us 
	@RequestMapping(value="/AboutUs",method=RequestMethod.GET)
	public String AboutUs()
	{
		
		return "AboutUs";
	}
	//contact us
	@RequestMapping(value="/ContactUs",method=RequestMethod.GET)
	public String ContactUs()
	{
		
		return "ContactUs";
	}
	
	//signup user
	@RequestMapping(value="/authSignUp",method=RequestMethod.POST)
	public ModelAndView saveUserData(@ModelAttribute("user") User userReq)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("LogIn");
		userReq.setSsoId(userReq.getEmail());
		userReq.setRole("ROLE_USER");
		userDao.addUser(userReq);
		mv.addObject("message", userReq.getSsoId()+" User added successful.");
		mv.addObject("user",new User());
		return mv;
	}
	//logout user
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		model.setViewName("index");
		return "index";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}

}
