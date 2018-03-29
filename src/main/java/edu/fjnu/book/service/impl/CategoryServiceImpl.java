package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.book.dao.CategoryDao;
import edu.fjnu.book.domain.Category;
import edu.fjnu.book.service.CategoryService;

/**
 * 书架分类管理具体实现方法
 * @author hspcadmin
 *
 */
@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryDao categoryDao;
	
	public Category get(Serializable id) {
		// TODO Auto-generated method stub
		return categoryDao.get(id);
	}

	public void insert(Category category) {
		// TODO Auto-generated method stub
		categoryDao.insert(category);
	}

	public void update(Category category) {
		// TODO Auto-generated method stub
		categoryDao.update(category);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		categoryDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub

	}

	public Category getStu(Category category) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageInfo<Category> findByPage(Category category, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Category> list = categoryDao.find(category);
	    //用PageInfo对结果进行包装
	    PageInfo<Category> page = new PageInfo<Category>(list);
	    return page;
	}

}
