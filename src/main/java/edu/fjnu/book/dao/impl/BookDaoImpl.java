package edu.fjnu.book.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.BookDao;
import edu.fjnu.book.domain.Book;

@Repository
public class BookDaoImpl extends BaseDaoImpl<Book> implements BookDao{
	
	public BookDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.BookMapper.");			//设置命名空间
	}
	public List<Book> findPending(Book book) {
		return this.getSqlSession().selectList(this.getNs()+"findPending",book);
	}

	public Book getStu(Book book) {
		return null;
	}
	public List<Book> getBookByType(Serializable id) {
		return this.getSqlSession().selectList(this.getNs()+"getBookByType",id);
	}
	public List<Book> getBookByMark(Map<String,Object>map) {
		return this.getSqlSession().selectList(this.getNs()+"getBookByMark",map);
	}
	public List<Book> getBookRank(Book book) {
		return this.getSqlSession().selectList(this.getNs()+"getBookRank",book);
	}
	public List<Book> getBookByIds(Book book) {
		return this.getSqlSession().selectList(this.getNs()+"getBookByIds",book);
	}
	public List<Book> getBooksByName(Book book) {
		return this.getSqlSession().selectList(this.getNs()+"getBooksByName",book);
	}

}
