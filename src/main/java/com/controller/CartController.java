package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.CartDao;
import com.Dao.ProductDao;
import com.Dao.UserDao;
import com.Model.Cart;
import com.Model.Product;
import com.Model.User;

@Controller
@RequestMapping(value="/cart")
public class CartController {

	@Autowired
	CartDao cartDao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	UserDao userDao;
	
	//checkout after sjoppping
	@RequestMapping(value="/checkout",method=RequestMethod.GET)
	public ModelAndView cartCheckout(){
		ModelAndView mv = new ModelAndView("CheckOut");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDao.getUser(email);
		if(user==null){
			mv.addObject("msg","Kindly login first.");
			return mv;
		}
		List<Cart> cartList = cartDao.findCartById(String.valueOf(user.getId()));
		double total = 0.00;
		for (Cart cart : cartList) {
			total = total + cart.getCartPrice();
		}
		mv.addObject("total",total);
		mv.addObject("userdetails",user);
		return mv;
	}
	//remove cart
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public ModelAndView removeCart(@RequestParam("cartId") Integer cartId){
		ModelAndView mv = new ModelAndView("ShowCart");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDao.getUser(email);
		if(user==null){
			mv.addObject("msg","Kindly login first.");
			return mv;
		}
		Cart cart = cartDao.getCartById(String.valueOf(user.getId()), cartId);
		mv.addObject("msg",cart.getCartProductName()+" removed successful.");
		cartDao.deleteCart(cart);
		List<Cart> cartList = cartDao.findCartById(String.valueOf(user.getId()));
		mv.addObject("cartList",cartList);
		return mv;
	}
	//show all cart
	@RequestMapping(value="/show",method=RequestMethod.GET)
	public ModelAndView showCart(){
		ModelAndView mv = new ModelAndView("ShowCart");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDao.getUser(email);
		if(user==null){
			mv.addObject("msg","Kindly login first.");
			return mv;
		}
		List<Cart> cartList = cartDao.findCartById(String.valueOf(user.getId()));
		mv.addObject("cartList",cartList);
		return mv;
	}
	//add to cart
	@RequestMapping(value="/added",method=RequestMethod.POST)
	public ModelAndView addtoCart(@RequestParam("productId") String productId,@RequestParam("qty") Integer qty){
		
		ModelAndView mv = new ModelAndView("ProductDetail");
		Product product = productDao.getProduct(Integer.parseInt(productId));
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDao.getUser(email);
		if(user==null){
			mv.addObject("Products", product);
			mv.addObject("msg","Kindly login first.");
			return mv;
		}
		
		if(qty >= product.getStock()){
			mv.addObject("Products", product);
			mv.addObject("msg","Added quentity should be less then stock.");
			return mv;
		}
		Cart cart = new Cart();
		cart.setCartProductId(product.getPid());
		if(qty!=null){
			cart.setCartQty(qty);
		}else{
			cart.setCartQty(1);
		}
		cart.setCartProductName(product.getProductName());
		cart.setCartPrice(qty*product.getPrice());
		cart.setUserEmail(user);
		cart.setCartImage(product.getImageName());
		
		cartDao.insertCart(cart);
		mv.addObject("Products", product);
		mv.addObject("msg","Product "+product.getProductName()+" added successful.");
		return mv;
		
	}
}
