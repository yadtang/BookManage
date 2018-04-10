package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fjnu.book.dao.LoveBookDao;
import edu.fjnu.book.domain.LoveBook;
import edu.fjnu.book.service.LoveBookService;
@Service
public class LoveBookServiceImpl implements LoveBookService{
	@Autowired
	LoveBookDao loveBookDao;
	
	public LoveBook get(Serializable id) {
		return loveBookDao.get(id);
	}

	public void insert(LoveBook loveBook) {
		loveBookDao.insert(loveBook);
	}

	public void update(LoveBook loveBook) {
		loveBookDao.update(loveBook);
	}

	public void delete(Serializable id) {
		loveBookDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		loveBookDao.delete(ids);
	}

	public List<LoveBook> find(LoveBook loveBook) {
		return loveBookDao.find(loveBook);
	}

	public List<LoveBook> getByUser(LoveBook loveBook) {
		// TODO Auto-generated method stub
		return loveBookDao.getByUser(loveBook);
	}

}
