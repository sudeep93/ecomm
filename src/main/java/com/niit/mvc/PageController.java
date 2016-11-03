package com.niit.mvc;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.model.Product;
import com.niit.model.Supplier;
import com.niit.services.SupplierService;
@Controller
public class PageController {
	

	@Autowired
	private SupplierService supplierService;
	


	
	

	
	/*
//	 * PRODUCT CATEGORY and SUPPPLIER 
	 */
	
	
	
	
		

	

	@RequestMapping(value={"/admin/product/supplier/add"})
	public String supplier(Model model)
	{
model.addAttribute("Product", new Product());
	
		model.addAttribute("Supplier", new Supplier());


model.addAttribute("suppliers", this.supplierService.getSuppliers());
model.addAttribute("supplierList", this.supplierService.getAllSupplier());
		
		
		return "Supplier";
	}
	
	
	@RequestMapping(value = {"/admin/product/supplier/add"}, method=RequestMethod.POST)
	public String addSupplier(@Valid @ModelAttribute("Supplier")Supplier supplier, BindingResult results, Model model)
	{
		if(results.hasErrors())
		{
			return "Supplier";
		}
		
		this.supplierService.addSupplier(supplier);

model.addAttribute("suppliers", this.supplierService.getSuppliers());
model.addAttribute("supplierList", this.supplierService.getAllSupplier());
		
		return "redirect:/admin/product/supplier/add" ;
	}

	

	
	
/*   
 *  DELETE and UPDATE 
 */
	
	@RequestMapping(value="/admin/product/supplier/delete/{id}")
	public String deleteSupplier(@PathVariable("id")String id, ModelMap model){
		this.supplierService.deleteSupplier(id);
		
		return "redirect:/admin/product/supplier/add";
	}
	
	@RequestMapping(value="/admin/product/supplier/edit/{id}")
	public String editSupplier(@PathVariable("id")String id,Model model){
		model.addAttribute("Supplier", this.supplierService.getSupplierById(id));
		model.addAttribute("supplierList", this.supplierService.getAllSupplier());
		return "Supplier";
	}
	
	
	/*
	 * 
	 *CART  
	 * 
	 */;
	

}


	
	
	
	
