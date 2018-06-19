package com.demo.fyshop.category.vo;

import java.util.HashSet;
import java.util.Set;

import com.demo.fyshop.categorysecond.vo.CategorySecond;

/**
 * 一级分类实体类
 * 
 * @author wanghuanjie
 *
 */
public class Category {
	private Integer cid;
	private String cname;
	// 一级分类中存放二级分类的集合:
	private Set<CategorySecond> categorySeconds = new HashSet<CategorySecond>();

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Set<CategorySecond> getCategorySeconds() {
		return categorySeconds;
	}

	public void setCategorySeconds(Set<CategorySecond> categorySeconds) {
		this.categorySeconds = categorySeconds;
	}

}

/*
 * -----------------------------------------------------------------------一级分类表
 * CREATE TABLE `category` ( `cid` int(11) NOT NULL AUTO_INCREMENT, `cname`
 * varchar(255) DEFAULT NULL, PRIMARY KEY (`cid`) );
 ************************************************************ 
 * 插入数据 INSERT INTO `category` VALUES (1,'女装男装'); INSERT INTO `category` VALUES
 * (2,'鞋靴箱包'); INSERT INTO `category` VALUES (3,'运动户外'); INSERT INTO `category`
 * VALUES (4,'珠宝配饰'); INSERT INTO `category` VALUES (5,'手机数码'); INSERT INTO
 * `category` VALUES (6,'家电办公'); INSERT INTO `category` VALUES (7,'护肤彩妆');
 */
