package com.demo.fyshop.order.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.demo.fyshop.order.dao.OrderDao;
import com.demo.fyshop.order.vo.Order;
import com.demo.fyshop.order.vo.OrderItem;
import com.demo.fyshop.utils.PageBean;

/**
 * 订单模块的业务逻辑层
 * 
 * @author wanghuanjie
 * 
 */
@Transactional
public class OrderService {
	// 注入OrderDao
	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	// Service:保存订单
	public void save(Order order) {
		orderDao.save(order);
	}

	// Service:根据用户id查询订单,带分页查询.
	public PageBean<Order> findByUid(Integer uid, Integer page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		// 显示5个
		int limit = 5;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = orderDao.findCountByUid(uid);
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 设置每页显示数据集合:
		int begin = (page - 1) * limit;
		List<Order> list = orderDao.findPageByUid(uid, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	// Service:根据订单id查询订单
	public Order findByOid(Integer oid) {
		return orderDao.findByOid(oid);
	}

	// Service:修改订单
	public void update(Order currOrder) {
		orderDao.update(currOrder);
	}

	// Service:后台查询所有订单
	public PageBean<Order> findAll(Integer page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		// 设置参数
		pageBean.setPage(page);
		// 设置每页显示的记录数:
		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数
		int totalCount = orderDao.findCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 设置每页显示数据集合
		int begin = (page - 1) * limit;
		List<Order> list = orderDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	// Service:查询订单项
	public List<OrderItem> findOrderItem(Integer oid) {
		return orderDao.findOrderItem(oid);
	}

}
