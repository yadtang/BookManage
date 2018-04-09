package edu.fjnu.book.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.BookDao;
import edu.fjnu.book.domain.Book;

@Repository
public class BookDaoImpl extends BaseDaoImpl<Book> implements BookDao{
	
	public BookDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.BookMapper.");			//设置命名空间
	}
	public List<Book> findPending(Book book) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(this.getNs()+"findPending",book);
	}

	public Book getStu(Book book) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<Book> getBookByType(Serializable id) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(this.getNs()+"getBookByType",id);
	}

}
