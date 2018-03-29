package edu.fjnu.book.service;

import java.io.Serializable;

import com.github.pagehelper.PageInfo;

import edu.fjnu.book.domain.BookType;

public interface BookTypeService {
	public BookType get(Serializable id);
	public void insert(BookType bookType);
	public void update(BookType bookType);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	/**查询分页信息*/
	public BookType getStu(BookType bookType);
	/**分页查询分类信息*/
	public PageInfo<BookType> findByPage(BookType bookType, Integer pageNo,Integer pageSize);
}
