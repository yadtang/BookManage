package edu.fjnu.book.dao;

import java.util.List;

import edu.fjnu.book.domain.LoveBook;

public interface LoveBookDao extends BaseDao<LoveBook> {
	public List<LoveBook> getByUser(LoveBook loveBook);
}
