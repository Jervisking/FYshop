package com.demo.fyshop.user.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.demo.fyshop.user.dao.UserDao;
import com.demo.fyshop.user.vo.User;
import com.demo.fyshop.utils.MailUtils;
import com.demo.fyshop.utils.PageBean;
import com.demo.fyshop.utils.UUIDUtils;

/**
 * 用户模块业务逻辑层
 * 
 * @author wanghuanjie
 * 
 */
@Transactional
public class UserService {
	// 注入UserDao
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	// Service:按用户名查询用户
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	// Service:用户注册
	public void save(User user) {
		// 将数据存入到数据库
		user.setState(0); // 0:代表用户未激活. 1:代表用户已经激活.
		String code = UUIDUtils.getUUID() + UUIDUtils.getUUID();
		user.setCode(code);
		userDao.save(user);
		// 发送激活邮件;
		MailUtils.sendMail(user.getEmail(), code);

	}

	// Service:根据激活码查询用户
	public User findByCode(String code) {
		return userDao.findByCode(code);
	}

	// Service:修改用户的状态
	public void update(User existUser) {
		userDao.update(existUser);
	}

	// Service:用户登录
	public User login(User user) {
		return userDao.login(user);
	}

	// Service:用户查询所有
	public PageBean<User> findByPage(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		// 显示10个
		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = userDao.findCount();
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
		List<User> list = userDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	// Service:根据id查询用户
	public User findByUid(Integer uid) {
		return userDao.findByUid(uid);
	}

	// Service:删除用户
	public void delete(User existUser) {
		userDao.delete(existUser);
	}

}
