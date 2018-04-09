package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.book.dao.EvaluateDao;
import edu.fjnu.book.domain.Evaluate;
import edu.fjnu.book.service.EvaluateService;
@Service
public class EvaluateServiceImpl implements EvaluateService{
	@Autowired
	EvaluateDao evaluateDao;
	
	public Evaluate get(Serializable id) {
		// TODO Auto-generated method stub
		return evaluateDao.get(id);
	}

	public void insert(Evaluate evaluate) {
		// TODO Auto-generated method stub
		evaluateDao.insert(evaluate);
	}

	public void update(Evaluate evaluate) {
		// TODO Auto-generated method stub
		evaluateDao.update(evaluate);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		evaluateDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		evaluateDao.delete(ids);
	}


	public PageInfo<Evaluate> findByPage(Evaluate evaluate, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Evaluate> list = evaluateDao.find(evaluate);
	    //用PageInfo对结果进行包装
	    PageInfo<Evaluate> page = new PageInfo<Evaluate>(list);
	    return page;
	}

	public List<Evaluate> find(Evaluate evaluate) {
		// TODO Auto-generated method stub
		return evaluateDao.find(evaluate);
	}

}
