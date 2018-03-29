package edu.fjnu.book.dao;

import java.util.List;

import edu.fjnu.book.domain.Category;

public interface CategoryDao extends BaseDao<Category>{
	public List<Category> findPending(Category category);
	public Category getStu(Category category);
}
