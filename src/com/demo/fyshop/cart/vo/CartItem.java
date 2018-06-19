package com.demo.fyshop.cart.vo;

import com.demo.fyshop.product.vo.Product;

/**
 * 购物项对象的实体类
 * 
 * @author wanghuanjie
 * 
 */
public class CartItem {
	private Product product; // 购物项中商品信息
	private int count; // 购买某种商品数量
	private double subtotal; // 购买某种商品小计

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	// 自动计算小计
	public double getSubtotal() {
		return count * product.getShop_price();
	}

}
