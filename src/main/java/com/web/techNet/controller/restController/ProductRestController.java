package com.web.techNet.controller.restController;

import com.web.techNet.entity.Product;
import com.web.techNet.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/rest/products")
public class ProductRestController {
	@Autowired
	ProductService productService;

	@GetMapping()
	public List<Product> getAll() {
		return productService.findAll();
	}

	@GetMapping("{id}")
	public Product getOne(@PathVariable("id") Long id) {
		return productService.findById(id).get();
	}

//	@PostMapping
//	public Product create(@RequestBody Product product) {
//		return productService.create(product);
//	}
//
//	@PutMapping("{id}")
//	public Product update(@PathVariable("id") Integer id, @RequestBody Product product) {
//		return productService.update(product);
//	}
//
//	@DeleteMapping("{id}")
//	public void delete(@PathVariable("id") Integer id) {
//		productService.delete(id);
//	}
}
