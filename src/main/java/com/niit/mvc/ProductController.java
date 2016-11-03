package com.niit.mvc;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.services.ProductService;
import com.niit.services.SupplierService;
@Controller
public class ProductController {
	@Autowired
private ProductService productService;

	@Autowired
	private SupplierService supplierService;
	
	
	
public ProductService getProductService() {
	return productService;
}

public void setProductService(ProductService productService) {
	this.productService = productService;
}

@RequestMapping("/getAllProducts")
public @ResponseBody List<Product> getAllProductsInJSON(){
	return productService.getAllProducts();
}

@RequestMapping("/productsList")
public String getProducts(){
	return "productsList";
}


//@RequestMapping("/getAllProducts")
//public ModelAndView getAllProducts(){
//	List<Product> products = productService.getAllProducts();
//	return new ModelAndView("productsList","products",products);
//}
@RequestMapping("getProductByIsbn/{isbn}")
public ModelAndView getProductByIsbn(@PathVariable(value="isbn") int isbn){
	Product b=productService.getProductByIsbn(isbn);
return new ModelAndView("productPage","productObj",b);

}
@RequestMapping("/admin/delete/{isbn}")
public String deleteProduct(@PathVariable(value="isbn") int isbn){
	productService.deleteProduct(isbn);
	Path path=Paths.get("C:\\Users\\SUDEEP SAWANT\\workspace\\com.niit\\src\\main\\webapp\\WEB-INF\\resources\\images\\" + isbn + ".png");
	if(Files.exists(path))
			{
		           try {
					Files.delete(path);
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
	
	

	//http://localhost:8080/appname/getAllProducts
	return "redirect:/productsList";
}

@RequestMapping(value="/admin/product/addProduct",method=RequestMethod.GET)
public String getProductForm(Model model){
	Product product=new Product();
	Category category=new Category();
	category.setCid(1);//New Arrivals
	model.addAttribute("suppliers", this.supplierService.getSuppliers());
	//set the category as 1 for the Product product
	product.setCategory(category);
	model.addAttribute("productFormObj",product);
	return "productForm";
	
}
//@RequestMapping(value="/admin/product/addSupplier",method=RequestMethod.GET)
//public String getSupplierForm(Model model){
//	Product product=new Product();
//	Supplier supplier=new Supplier();
//	//supplier.setSupplierId(1);//New Arrivals
//	//set the category as 1 for the Product product
//	product.setSupplier(supplier);
//	model.addAttribute("supplierFormObj",product);
//	return "supplier";
//	
//}


@RequestMapping(value="/admin/product/addProduct",method=RequestMethod.POST)
public String addProduct(@ModelAttribute(value="productFormObj")  Product product,BindingResult result){
	
	
	if(result.hasErrors())
		return "productForm";
	productService.addProduct(product);
	MultipartFile image=product.getProductImage();
	if(image!=null && !image.isEmpty()){
	Path path=Paths.get("C:\\Users\\SUDEEP SAWANT\\workspace\\com.niit\\src\\main\\webapp\\WEB-INF\\resources\\images\\" + product.getIsbn() + ".png");
	try {
		image.transferTo(new File(path.toString()));
	} catch (IllegalStateException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	return "redirect:/productsList";
}




@RequestMapping("/admin/product/editProduct/{isbn}")
public ModelAndView getEditForm(@PathVariable(value="isbn")  int isbn){
	
	
	
	Path path=Paths.get("C:\\Users\\SUDEEP SAWANT\\Desktop\\MyWebsite\\src\\main\\webapp\\WEB-INF\\resources\\images\\" + isbn + ".png");
	if(Files.exists(path))
			{
		           try {
					Files.delete(path);
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
	
	//First read the record which has to be updated
	//select * from productapp where isbn=?
	//Populate the form with already existing value
	Product product=this.productService.getProductByIsbn(isbn);
	return new ModelAndView("editForm","editProductObj",product);
}
@RequestMapping(value="/admin/product/editProduct",method=RequestMethod.POST)
public String editProduct(@ModelAttribute(value="editProductObj") Product product,BindingResult result)
{
	
	
	if(result.hasErrors())
		return "productForm";
	productService.editProduct(product);
	MultipartFile image=product.getProductImage();
	if(image!=null && !image.isEmpty()){
	Path path=Paths.get("C:\\Users\\SUDEEP SAWANT\\workspace\\com.niit\\src\\main\\webapp\\WEB-INF\\resources\\images\\" + product.getIsbn() + ".png");
	try {
		image.transferTo(new File(path.toString()));
	} catch (IllegalStateException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	
return "redirect:/productsList";

}

}


