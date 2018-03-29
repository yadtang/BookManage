package edu.fjnu.book.dao;

import java.util.List;

import edu.fjnu.book.domain.BookType;

public interface BookTypeDao extends BaseDao<BookType>{
	public List<BookType> findPending(BookType bookType);
	public BookType getStu(BookType bookType);
}
