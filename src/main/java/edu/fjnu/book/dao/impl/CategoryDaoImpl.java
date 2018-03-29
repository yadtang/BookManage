package edu.fjnu.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.CategoryDao;
import edu.fjnu.book.domain.Category;

@Repository
public class CategoryDaoImpl extends BaseDaoImpl<Category> implements CategoryDao{

	public CategoryDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.CategoryMapper.");			//设置命名空间
	}
	
	public List<Category> findPending(Category category) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(this.getNs()+"findPending",category);
	}

	public Category getStu(Category category) {
		// TODO Auto-generated method stub
		return null;
	}

}
