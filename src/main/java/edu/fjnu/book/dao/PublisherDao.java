package edu.fjnu.book.dao;

import java.util.List;

import edu.fjnu.book.domain.Publisher;

public interface PublisherDao extends BaseDao<Publisher>{
	public List<Publisher> findPending(Publisher publisher);
	public Publisher getStu(Publisher publisher);
}
