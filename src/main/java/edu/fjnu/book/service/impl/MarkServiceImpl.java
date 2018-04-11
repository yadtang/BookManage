package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fjnu.book.dao.MarkDao;
import edu.fjnu.book.domain.Mark;
import edu.fjnu.book.service.MarkService;
@Service
public class MarkServiceImpl implements MarkService {
	@Autowired
	MarkDao markDao;
	
	public List<Mark> find(Mark mark) {
		// TODO Auto-generated method stub
		return markDao.find(mark);
	}

	public Mark get(Serializable id) {
		// TODO Auto-generated method stub
		return markDao.get(id);
	}

	public void insert(Mark mark) {
		// TODO Auto-generated method stub
		markDao.insert(mark);
	}

	public void update(Mark mark) {
		// TODO Auto-generated method stub
		markDao.update(mark);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		markDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		markDao.delete(ids);
	}

}
