package com.web.techNet.RestController;

import java.util.List;

import com.web.techNet.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.techNet.entity.Category;


@RestController
@CrossOrigin("*")
@RequestMapping("/rest/categories")
public class CategoryRestController {
	@Autowired
    CategoryService categoryService;

	@GetMapping()
	public List<Category> getAll() {
		return categoryService.findAll();
	}
}
