package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.book.dao.BookTypeDao;
import edu.fjnu.book.domain.BookType;
import edu.fjnu.book.service.BookTypeService;
@Service
public class BookTypeServiceImpl implements BookTypeService{
	@Autowired
	BookTypeDao bookTypeDao;
	
	public BookType get(Serializable id) {
		// TODO Auto-generated method stub
		return bookTypeDao.get(id);
	}

	public void insert(BookType bookType) {
		// TODO Auto-generated method stub
		bookTypeDao.insert(bookType);
	}

	public void update(BookType bookType) {
		// TODO Auto-generated method stub
		bookTypeDao.update(bookType);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		bookTypeDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		bookTypeDao.delete(ids);
	}

	public BookType getStu(BookType bookType) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageInfo<BookType> findByPage(BookType bookType, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<BookType> list = bookTypeDao.find(bookType);
	    //用PageInfo对结果进行包装
	    PageInfo<BookType> page = new PageInfo<BookType>(list);
	    return page;
	}

}
