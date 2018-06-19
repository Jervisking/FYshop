package com.demo.fyshop.cart.action;

import org.apache.struts2.ServletActionContext;

import com.demo.fyshop.cart.vo.Cart;
import com.demo.fyshop.cart.vo.CartItem;
import com.demo.fyshop.product.service.ProductService;
import com.demo.fyshop.product.vo.Product;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 购物车模块的界面层
 * 
 * @author wanghuanjie
 * 
 */
public class CartAction extends ActionSupport {
	// 接收pid
	private Integer pid;
	// 接收数量count
	private Integer count;
	// 注入商品的Service
	private ProductService productService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	// Action:购物车添加购物项
	public String addCart() {
		// 封装一个CartItem对象.
		CartItem cartItem = new CartItem();
		// 设置数量:
		cartItem.setCount(count);
		// 根据pid进行查询商品:
		Product product = productService.findByPid(pid);
		// 设置商品:
		cartItem.setProduct(product);
		// 将购物项添加到购物车.
		// 购物车应该存在session中.
		Cart cart = getCart();
		cart.addCart(cartItem);

		return "addCart";
	}

	// Action:购物车的清空
	public String clearCart() {
		// 获得购物车对象.
		Cart cart = getCart();
		// 调用购物车中清空方法.
		cart.clearCart();
		return "clearCart";
	}

	// Action:购物车移除购物项
	public String removeCart() {
		// 获得购物车对象
		Cart cart = getCart();
		// 调用购物车中移除的方法:
		cart.removeCart(pid);
		// 返回页面:
		return "removeCart";
	}

	// Action:跳转我的购物车
	public String myCart() {
		return "myCart";
	}

	// Action:获得购物车,从session中获得购物车.
	private Cart getCart() {
		Cart cart = (Cart) ServletActionContext.getRequest().getSession()
				.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			ServletActionContext.getRequest().getSession()
					.setAttribute("cart", cart);
		}
		return cart;
	}
}
