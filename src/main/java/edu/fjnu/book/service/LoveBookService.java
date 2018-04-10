package edu.fjnu.book.service;

import java.io.Serializable;
import java.util.List;
import edu.fjnu.book.domain.LoveBook;

public interface LoveBookService {
	public List<LoveBook> find(LoveBook loveBook);
	public LoveBook get(Serializable id);
	public void insert(LoveBook loveBook);
	public void update(LoveBook loveBook);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	public List<LoveBook> getByUser(LoveBook loveBook);
}
