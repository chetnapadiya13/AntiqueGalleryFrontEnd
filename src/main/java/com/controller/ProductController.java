package com.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.CategoryDao;
import com.Dao.ProductDao;
import com.Dao.SupplierDao;
import com.Model.Category;
import com.Model.Product;
import com.Model.Supplier;

//dispathcher servlet will recognize it as a controller
@Controller

// in general mapping of this controller class methods to handle model as well
// view context/products/respective forms(views)
@RequestMapping(value = "/products")
public class ProductController {

	// wired dao obj with spring bean
	@Autowired
	CategoryDao categoryDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	private SupplierDao supplierDao;

	// product list for admin view prduct for admin
	//resource as a admin
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String ProductList(Model model) {
		model.addAttribute("category", new Category());
		model.addAttribute("product", new Product());
		List<Product> listProduct = productDao.showallProduct();
		model.addAttribute("listProduct", listProduct);
		return "ProductList";
	}

	// product list by category in admin product list
	@RequestMapping(value = "/admin/byCategory", method = RequestMethod.POST)
	public String ProductListByCategory(Model model, @ModelAttribute("category") Category cat) {
		model.addAttribute("category", new Category());
		model.addAttribute("product", new Product());
		List<Product> listProduct = null;
		if (!cat.getCid().equals("NONE")) {
			listProduct = productDao.getProductByCategory(Integer.parseInt(cat.getCid()));
		} else {
			listProduct = productDao.showallProduct();
		}

		model.addAttribute("listProduct", listProduct);
		return "ProductList";
	}

	// product list by category(for menu category)
	@RequestMapping(value = "/byCategory/{catId}", method = RequestMethod.GET)
	public String ProductListByCategoryID(Model model, @PathVariable("catId") String cat) {
		model.addAttribute("category", new Category());
		model.addAttribute("product", new Product());
		List<Product> listProduct = null;
		if (cat != null && !cat.equals("ALL")) {
			listProduct = productDao.getProductByCategory(Integer.parseInt(cat));
		} else {
			listProduct = productDao.showallProduct();
		}
		model.addAttribute("Products", listProduct);
		return "ShowProduct";
	}
	//delete product from product list
	@RequestMapping(value = "/admin/{productId}", method = RequestMethod.POST)
	public String DeleteProductList(Model model, @PathVariable("productId") String productId) {
		model.addAttribute("category", new Category());
		model.addAttribute("product", new Product());

		productDao.deleteProduct(Integer.parseInt(productId));

		List<Product> listProduct = productDao.showallProduct();
		model.addAttribute("listProduct", listProduct);
		return "ProductList";
	}
	
	//after deleteing modified view
	@RequestMapping(value = "/admin/modifyview", method = RequestMethod.POST)
	public ModelAndView modifyViewProductList(Model model, @RequestParam("pid") String productId) {
		model.addAttribute("category", new Category());
		model.addAttribute("product", new Product());

		Product product = productDao.getProduct(Integer.parseInt(productId));

		List<Product> listProduct = productDao.showallProduct();
		ModelAndView mv = new ModelAndView("AdminAdd");
		mv.addObject("modifyProduct", product);
		mv.addObject("event", "Product");
		mv.addObject("category", new Category());
		mv.addObject("supplier", new Supplier());
		return mv;
	}
	//detail product
	@RequestMapping(value = "/details/{pid}", method = RequestMethod.GET)
	public ModelAndView productDetails(Model model, @PathVariable("pid") String productId) {
		model.addAttribute("product", new Product());
		Product product = productDao.getProduct(Integer.parseInt(productId));
		ModelAndView mv = new ModelAndView("ProductDetail");
		mv.addObject("Products", product);

		return mv;
	}
	//update product
	@RequestMapping(value = "/admin/updateproduct", method = RequestMethod.POST, consumes = "multipart/form-data")
	public ModelAndView UpdatProductList(@ModelAttribute("product") Product product, BindingResult result,
			@RequestParam("pimage") MultipartFile file, HttpServletRequest req) {
		Product p1 = productDao.getProduct(product.getPid());

		System.out.println("IN save Product ()");

		String filePath = req.getSession().getServletContext().getRealPath("/");
		System.out.println("REAL PATH: " + filePath);

		String fileName = file.getOriginalFilename();
		System.out.println("FILE NAME: " + fileName);

		p1.setImageName("/" + "images/" + fileName);

		try {
			byte[] imageByte = file.getBytes();
			BufferedOutputStream fos = new BufferedOutputStream(
					new FileOutputStream(filePath + "\\images\\" + fileName));
			System.out.println("NEW PATH: " + filePath + "\\images\\" + fileName);
			fos.write(imageByte);
			fos.close();
		} catch (Exception e) {
			System.out.println("Ex in SAVEPROD : " + e);
		}

		// SET Category into Product
		System.out.println("SELECTED CATEGORY: " + req.getParameter("category"));
		Category category = new Category();
		category.setCid((req.getParameter("category")));
		p1.setCategory(category);

		// SET Supplier into Product
		System.out.println("SELECTED SUPPLIER: " + req.getParameter("supplier"));
		Supplier supplier = new Supplier();
		supplier.setSid(req.getParameter("supplier"));
		p1.setSupplier(supplier);

		p1.setPrice(Float.valueOf(req.getParameter("price")));
		p1.setProductDescription(req.getParameter("productDescription"));
		p1.setProductName(req.getParameter("productName"));
		p1.setStock(Integer.parseInt(req.getParameter("stock")));

		productDao.updateProduct(p1);

		ModelAndView mv = new ModelAndView("AdminAdd");
		mv.addObject("modifyProduct", p1);
		mv.addObject("msg", "Product modify Successfully");
		mv.addObject("event", "Product");
		mv.addObject("category", new Category());
		mv.addObject("supplier", new Supplier());
		return mv;
	}

	// returning all categories to Product form
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		return categoryDao.showallCatList();
	}

	// returing all supplier to Product form
	@ModelAttribute("suppliers")
	public List<Supplier> getSuppliers() {
		return (List<Supplier>) supplierDao.getAllSuppliers();
	}
}
