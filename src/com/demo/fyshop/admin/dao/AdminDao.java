package com.demo.fyshop.admin.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.demo.fyshop.admin.vo.Admin;

/**
 * 管理员模块的数据访问层
 * 
 * @author wanghuanjie
 * 
 */
public class AdminDao extends HibernateDaoSupport {

	// Dao:登录
	public Admin login(Admin admin) {
		String hql = "from Admin where username = ? and password = ?";
		List<Admin> list = this.getHibernateTemplate().find(hql,
				admin.getUsername(), admin.getPassword());
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
