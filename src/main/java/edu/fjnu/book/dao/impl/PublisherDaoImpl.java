package edu.fjnu.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.PublisherDao;
import edu.fjnu.book.domain.Publisher;

@Repository
public class PublisherDaoImpl extends BaseDaoImpl<Publisher> implements PublisherDao{
	
	public PublisherDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.PublisherMapper.");			//设置命名空间
	}
	public List<Publisher> findPending(Publisher publisher) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(this.getNs()+"findPending",publisher);
	}

	public Publisher getStu(Publisher publisher) {
		// TODO Auto-generated method stub
		return null;
	}

}
