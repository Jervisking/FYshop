package com.demo.fyshop.category.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.demo.fyshop.category.dao.CategoryDao;
import com.demo.fyshop.category.vo.Category;
import com.demo.fyshop.utils.PageBean;

/**
 * 一级分类业务逻辑层
 * 
 * @author wanghuanjie
 * 
 */
@Transactional
public class CategoryService {
	// 注入CategoryDao
	private CategoryDao categoryDao;

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	// Service:查询所有一级分类
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	// Service:保存一级分类
	public void save(Category category) {
		categoryDao.save(category);
	}

	// Service:根据一级分类id查询一级分类
	public Category findByCid(Integer cid) {
		return categoryDao.findByCid(cid);
	}

	// Service:删除一级分类
	public void delete(Category category) {
		categoryDao.delete(category);
	}

	// Service:修改一级分类
	public void update(Category category) {
		categoryDao.update(category);
	}

	// Service:分页查询
	public PageBean<Category> findByPage(Integer page) {
		PageBean<Category> pageBean = new PageBean<Category>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		// 显示10个
		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = categoryDao.findCount();
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
		List<Category> list = categoryDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

}
