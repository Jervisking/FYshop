package com.demo.fyshop.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.demo.fyshop.user.vo.User;
import com.demo.fyshop.utils.PageHibernateCallback;

/**
 * 用户模块数据访问层
 * 
 * @author wanghuanjie
 * 
 */
public class UserDao extends HibernateDaoSupport {
	// Dao:按用户名查询是否有该用户
	public User findByUsername(String username) {
		String hql = "from User where username = ?";
		List<User> list = this.getHibernateTemplate().find(hql, username);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	// Dao:注册用户存入数据库
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}

	// Dao:根据激活码查询用户
	public User findByCode(String code) {
		String hql = "from User where code = ?";
		List<User> list = this.getHibernateTemplate().find(hql, code);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	// Dao:修改用户状态
	public void update(User existUser) {
		this.getHibernateTemplate().update(existUser);
	}

	// Dao:用户登录
	public User login(User user) {
		String hql = "from User where username = ? and password = ? and state = ?";
		List<User> list = this.getHibernateTemplate().find(hql,
				user.getUsername(), user.getPassword(), 1);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	// Dao:查询用户个数
	public int findCount() {
		String hql = "select count(*) from User";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	// Dao:分页查询用户
	public List<User> findByPage(int begin, int limit) {
		String hql = "from User order by uid desc";
		List<User> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<User>(hql, null, begin, limit));
		return list;
	}

	// Dao:根据id查询用户
	public User findByUid(Integer uid) {
		return this.getHibernateTemplate().get(User.class, uid);
	}

	// Dao:删除用户
	public void delete(User existUser) {
		this.getHibernateTemplate().delete(existUser);
	}
}
