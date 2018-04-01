package edu.fjnu.book.dao;

import java.util.List;

import edu.fjnu.book.domain.Book;

public interface BookDao extends BaseDao<Book>{
	public List<Book> findPending(Book book);
	public Book getStu(Book book);
}
