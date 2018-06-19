package com.demo.fyshop.index.action;

import java.util.List;

import com.demo.fyshop.category.service.CategoryService;
import com.demo.fyshop.category.vo.Category;
import com.demo.fyshop.product.service.ProductService;
import com.demo.fyshop.product.vo.Product;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 首页访问界面层
 * 
 * @author wanghuanjie
 * 
 */
public class IndexAction extends ActionSupport {
	// 注入一级分类的Service:
	private CategoryService categoryService;
	// 注入商品的Service
	private ProductService productService;

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	// Action:访问首页
	public String execute() {
		// 查询所有一级分类集合
		List<Category> cList = categoryService.findAll();
		// 将一级分类存入到Session的范围:
		ActionContext.getContext().getSession().put("cList", cList);
		// 查询热门商品
		List<Product> hList = productService.findHot();
		// 保存到值栈
		ActionContext.getContext().getValueStack().set("hList", hList);
		// 查询最新商品
		List<Product> nList = productService.findNew();
		// 保存到值栈
		ActionContext.getContext().getValueStack().set("nList", nList);
		return "index";
	}
}
