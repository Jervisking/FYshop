package com.demo.fyshop.category.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.demo.fyshop.category.vo.Category;
import com.demo.fyshop.utils.PageHibernateCallback;

/**
 * 一级分类数据访问层
 * 
 * @author wanghuanjie
 * 
 */
public class CategoryDao extends HibernateDaoSupport {

	// Dao:查询所有一级分类
	public List<Category> findAll() {
		String hql = "from Category";
		List<Category> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	// Dao:保存一级分类
	public void save(Category category) {
		this.getHibernateTemplate().save(category);
	}

	// Dao:根据一级分类id查询一级分类
	public Category findByCid(Integer cid) {
		return this.getHibernateTemplate().get(Category.class, cid);
	}

	// DAO:删除一级分类
	public void delete(Category category) {
		this.getHibernateTemplate().delete(category);
	}

	// Dao:修改一级分类
	public void update(Category category) {
		this.getHibernateTemplate().update(category);
	}

	// Dao:查询用户个数
	public int findCount() {
		String hql = "select count(*) from Category";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	// Dao:分页查询一级分类
	public List<Category> findByPage(int begin, int limit) {
		String hql = "from Category order by cid desc";
		List<Category> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Category>(hql, null, begin, limit));
		return list;
	}

}
