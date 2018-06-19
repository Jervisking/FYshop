package com.demo.fyshop.order.adminaction;

import java.util.List;

import com.demo.fyshop.order.service.OrderService;
import com.demo.fyshop.order.vo.Order;
import com.demo.fyshop.order.vo.OrderItem;
import com.demo.fyshop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台订单模块的界面层
 * 
 * @author wanghuanjie
 * 
 */
public class AdminOrderAction extends ActionSupport implements
		ModelDriven<Order> {
	// 模型驱动使用的类
	private Order order = new Order();

	public Order getModel() {
		return order;
	}

	// 接收page参数
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}

	// 注入OrderService
	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	// Action:后台查询所有订单
	public String findAll() {
		// 订单的分页查询
		PageBean<Order> pageBean = orderService.findAll(page);
		// 将数据存入到值栈中保存到页面
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		// 页面跳转:
		return "findAll";
	}

	// Action:修改订单状态
	public String updateState() {
		// 根据id查询订单
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setState(3);
		orderService.update(currOrder);
		// 页面跳转
		return "updateStateSuccess";
	}

	// Action:根据订单的id查询订单项
	public String findOrderItem() {
		// 根据订单id查询订单项:
		List<OrderItem> list = orderService.findOrderItem(order.getOid());
		// 显示到页面:
		ActionContext.getContext().getValueStack().set("list", list);
		// 页面跳转
		return "findOrderItem";
	}
}
