package com.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.CategoryDao;
import com.Dao.ProductDao;
import com.Dao.SupplierDao;
import com.Model.*;

@Controller
@RequestMapping(value="/AdminAdd")
public class AdminController 
{
	//private static String UPLOADED_FOLDER = "F://temp//";
	
	@Autowired 
	private CategoryDao categoryDao;
	
	@Autowired 
	private SupplierDao supplierDao;
	
	@Autowired 
	private ProductDao productDao;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView AdminAdd() {
		System.out.println("in adminController constructor");
		ModelAndView mv = new ModelAndView("AdminAdd");
		return mv;
	}
	//save category
	@RequestMapping(value = "/saveCategory", method = RequestMethod.POST)
	public ModelAndView saveCategotyData(@RequestParam("cid") String cid, @RequestParam("cname") String cname) {
		ModelAndView mv = new ModelAndView();
		Category category = new Category();
		category.setCid(cid);
		category.setCname(cname);

		categoryDao.insertCategory(category);
		mv.addObject("msg", "Category \'"+ cid + " - " + cname+ "\' Added Successfully");
		System.out.println("Category "  + cname + " Added Successfully");
		mv.setViewName("AdminAdd");
		mv.addObject("event", "Category");
		return mv;
	}

	// save supplier
	@RequestMapping(value = "/saveSuppliper", method = RequestMethod.POST)
	public ModelAndView saveSupplierData(@RequestParam("sid") String sid,
			@RequestParam("supplierName") String supplierName) {
		System.out.println("in saving product");
		System.out.println("SID: "+sid);
		System.out.println("SNAME: "+ supplierName);
		ModelAndView mv = new ModelAndView();

		Supplier supplier = new Supplier();
		supplier.setSid(sid);
		supplier.setSupplierName(supplierName);
		//supplierDaoImpl = new SupplierDaoImpl(); // not a DI
		supplierDao.insertSupp(supplier);
		System.out.println("Supplier Added Successfully.");
		mv.addObject("msg", "Supplier \'"+ sid + " - "+ supplierName  +"\' Added Successfully");
		mv.setViewName("AdminAdd");
		mv.addObject("event", "Supplier");
		return mv;
	}

	// save Product
	@RequestMapping(value = "/saveProduct",consumes = "multipart/form-data", method = RequestMethod.POST)
	public ModelAndView saveProduct( @ModelAttribute("product") Product product, BindingResult result,
			@RequestParam("pimage") MultipartFile file,
			HttpServletRequest req) {

		System.out.println("IN save Product ()");
				
		String filePath = req.getSession().getServletContext().getRealPath("/");
		System.out.println("REAL PATH: "+ filePath);
		
		String fileName = file.getOriginalFilename();
		System.out.println("FILE NAME: "+ fileName);
		
		product.setImageName("/"+"images/"+fileName);
				
		try {
			byte[] imageByte = file.getBytes();
			BufferedOutputStream fos = new BufferedOutputStream(
					new FileOutputStream(filePath + "\\images\\" + fileName));
			System.out.println("NEW PATH: "+ filePath + "\\images\\" + fileName);
			fos.write(imageByte);
			fos.close();
		} catch (Exception e) {
			System.out.println("Ex in SAVEPROD : "+e);
		}
		
		// SET Category into Product
		System.out.println("SELECTED CATEGORY: "+ req.getParameter("category"));
		Category category = new Category();
		category.setCid((req.getParameter("category")));
		product.setCategory(category);
		
		
		//SET Supplier into Product
		System.out.println("SELECTED SUPPLIER: "+req.getParameter("supplier"));
		Supplier supplier = new Supplier();
		supplier.setSid(req.getParameter("supplier"));
		product.setSupplier(supplier);
		
		productDao.insertProduct(product); 
		
		ModelAndView mv = new ModelAndView("AdminAdd");
		mv.addObject("msg", "Product Added Successfully");
		System.out.println("Product Inserted Successful");
		mv.addObject("event", "Product");
		return mv;
	}
	
	
	// return supplier model to admin page
	@ModelAttribute("supplier")
	public Supplier getSupplier(){
		return new Supplier();
	}
	
	//return product model to admin page
	@ModelAttribute("product")
	public Product getProduct(){
		return new Product();
	}
	
	//return category model to admin page
	@ModelAttribute("category")
	public Category getCategory(){
		return new Category();
	}
	
	
	//returning all categories to Product form
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return categoryDao.showallCatList();
	}
	
	//returing all supplier to Product form
	@ModelAttribute("suppliers")
	public List<Supplier> getSuppliers(){
		return (List<Supplier>) supplierDao.getAllSuppliers();
	}
		
}
