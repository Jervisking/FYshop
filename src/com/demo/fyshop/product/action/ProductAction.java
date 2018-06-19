package com.demo.fyshop.product.action;

import com.demo.fyshop.product.service.ProductService;
import com.demo.fyshop.product.vo.Product;
import com.demo.fyshop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 商品模块的界面层
 * 
 * @author wanghuanjie
 * 
 */
public class ProductAction extends ActionSupport implements
		ModelDriven<Product> {

	// 用于接收数据的模型驱动.
	private Product product = new Product();
	// 注入商品的Service
	private ProductService productService;

	// 接收分类cid
	private Integer cid;
	// 接收二级分类id
	private Integer csid;

	// 接收当前页数:
	private int page;

	public Product getModel() {
		return product;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getCsid() {
		return csid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	public void setPage(int page) {
		this.page = page;
	}

	// Action:根据商品的ID进行查询商品
	public String findByPid() {
		// 调用Service的方法完成查询.
		product = productService.findByPid(product.getPid());
		return "findByPid";
	}

	// Action:根据分类的id查询商品
	public String findByCid() {
		// IndexAction已查询所有一级分类,categoryService.findAll();
		// 根据一级分类查询商品(分页)
		PageBean<Product> pageBean = productService.findByPageCid(cid, page);
		// 将PageBean存入到值栈中:
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}

	// Action:根据二级分类id查询商品
	public String findByCsid() {
		// 根据二级分类查询商品
		PageBean<Product> pageBean = productService.findByPageCsid(csid, page);
		// 将PageBean存入到值栈中:
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCsid";
	}
}
