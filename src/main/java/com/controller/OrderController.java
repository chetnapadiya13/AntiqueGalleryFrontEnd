package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.CartDao;
import com.Dao.OrderDao;
import com.Dao.ProductDao;
import com.Dao.UserDao;
import com.Model.Cart;
import com.Model.Order;
import com.Model.User;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	@Autowired
	CartDao cartDao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	OrderDao orderDao;
	
	
	//redirect to invoice page
	@RequestMapping(value="/invoice",method=RequestMethod.POST)
	public ModelAndView cartInvoice(@RequestParam("option") String option){
		ModelAndView mv = new ModelAndView("Invoice");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDao.getUser(email);
		if(user==null){
			mv.addObject("msg","Kindly login first.");
			return mv;
		}
		List<Cart> cartList = cartDao.findCartById(String.valueOf(user.getId()));
		double total = 0.00;
		int totalQty = 0;
		for (Cart cart : cartList) {
			total = total + cart.getCartPrice();
			totalQty = totalQty + cart.getCartQty();
			cartDao.deleteCart(cart);
		}
		Order ord = new Order();
		ord.setPaymentMode(option);
		ord.setTotalAmount(total);
		ord.setUser(user);
		orderDao.insertOrder(ord);
		
		mv.addObject("total",total);
		mv.addObject("userdetails",user);
		mv.addObject("totalQty", totalQty);
		
		return mv;
	}
	
}
