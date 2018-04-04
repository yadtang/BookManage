package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.book.dao.SysconfigDao;
import edu.fjnu.book.domain.BookType;
import edu.fjnu.book.domain.Sysconfig;
import edu.fjnu.book.service.SysconfigService;
@Service
public class SysconfigServiceImpl implements SysconfigService {
	@Autowired
	SysconfigDao sysconfigDao;
	
	public List<Sysconfig> find(Sysconfig sysconfig) {
		// TODO Auto-generated method stub
		return sysconfigDao.find(sysconfig);
	}

	public Sysconfig get(Serializable id) {
		// TODO Auto-generated method stub
		return sysconfigDao.get(id);
	}

	public void insert(Sysconfig sysconfig) {
		// TODO Auto-generated method stub
		sysconfigDao.insert(sysconfig);
	}

	public void update(Sysconfig sysconfig) {
		// TODO Auto-generated method stub
		sysconfigDao.update(sysconfig);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		sysconfigDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		sysconfigDao.delete(ids);
	}

	public PageInfo<Sysconfig> findByPage(Sysconfig sysconfig, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Sysconfig> list = sysconfigDao.find(sysconfig);
	    //用PageInfo对结果进行包装
	    PageInfo<Sysconfig> page = new PageInfo<Sysconfig>(list);
	    return page;
	}

	public Sysconfig getByName(String name) {
		// TODO Auto-generated method stub
		return sysconfigDao.getByName(name);
	}

}
