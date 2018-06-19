package com.demo.fyshop.admin.service;

import org.springframework.transaction.annotation.Transactional;

import com.demo.fyshop.admin.dao.AdminDao;
import com.demo.fyshop.admin.vo.Admin;

/**
 * 管理员模块业务逻辑层
 * @author wanghuanjie
 *
 */
@Transactional
public class AdminService {

	// 注入Dao
	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	//Service:登录
	public Admin login(Admin admin) {
		return adminDao.login(admin);
	}

}
