package com.demo.fyshop.admin.action;

import org.apache.struts2.ServletActionContext;

import com.demo.fyshop.admin.service.AdminService;
import com.demo.fyshop.admin.vo.Admin;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 管理员模块的业务控制层
 * 
 * @author wanghuanjie
 * 
 */
public class AdminAction extends ActionSupport implements ModelDriven<Admin> {

	// 模型驱动对象
	private Admin admin = new Admin();

	public Admin getModel() {
		return admin;
	}

	// 注入AdminService
	private AdminService adminService;

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	// Action:后台登录
	public String login() {
		// 调用service方法完成登录
		Admin existAdmin = adminService.login(admin);
		// 判断
		if (existAdmin == null) {
			// 用户名或密码错误
			this.addActionError("用户名或密码错误!");
			return "loginFail";
		} else {
			// 登录成功:
			ServletActionContext.getRequest().getSession()
					.setAttribute("existAdmin", existAdmin);
			return "loginSuccess";
		}
	}
}
