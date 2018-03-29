package edu.fjnu.book.service;

import java.io.Serializable;

import com.github.pagehelper.PageInfo;

import edu.fjnu.book.domain.Category;

public interface CategoryService {
	public Category get(Serializable id);
	public void insert(Category category);
	public void update(Category category);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	/**查询分页信息*/
	public Category getStu(Category category);
	/**分页查询分类信息*/
	public PageInfo<Category> findByPage(Category category, Integer pageNo,Integer pageSize);
}
