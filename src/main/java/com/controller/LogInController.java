package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.Dao.UserDao;
import com.DaoImpl.*;
import com.Model.*;
import java.util.*;

@Controller
public class LogInController {
	//User user=null;
	
	@Autowired
	UserDao userDao;
	//redirect to login page
	@RequestMapping(value="/LogIn",method=RequestMethod.GET)
	public String LogIn()
	{
		return "LogIn";
		
	}
}
