package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.book.dao.BookTypeDao;
import edu.fjnu.book.dao.PublisherDao;
import edu.fjnu.book.domain.BookType;
import edu.fjnu.book.domain.Publisher;
import edu.fjnu.book.service.BookTypeService;
import edu.fjnu.book.service.PublisherService;
@Service
public class PublisherServiceImpl implements PublisherService{
	@Autowired
	PublisherDao publisherDao;
	
	public Publisher get(Serializable id) {
		// TODO Auto-generated method stub
		return publisherDao.get(id);
	}

	public void insert(Publisher publisher) {
		// TODO Auto-generated method stub
		publisherDao.insert(publisher);
	}

	public void update(Publisher publisher) {
		// TODO Auto-generated method stub
		publisherDao.update(publisher);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		publisherDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		publisherDao.delete(ids);
	}

	public Publisher getStu(Publisher publisher) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageInfo<Publisher> findByPage(Publisher publisher, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Publisher> list = publisherDao.find(publisher);
	    //用PageInfo对结果进行包装
	    PageInfo<Publisher> page = new PageInfo<Publisher>(list);
	    return page;
	}

	public List<Publisher> find(Publisher publisher) {
		// TODO Auto-generated method stub
		return publisherDao.find(publisher);
	}

}
