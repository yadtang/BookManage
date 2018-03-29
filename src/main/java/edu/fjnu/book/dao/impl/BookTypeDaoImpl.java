package edu.fjnu.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.BookTypeDao;
import edu.fjnu.book.domain.BookType;

@Repository
public class BookTypeDaoImpl extends BaseDaoImpl<BookType> implements BookTypeDao{
	
	public BookTypeDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.BookTypeMapper.");			//设置命名空间
	}
	public List<BookType> findPending(BookType bookType) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(this.getNs()+"findPending",bookType);
	}

	public BookType getStu(BookType bookType) {
		// TODO Auto-generated method stub
		return null;
	}

}
