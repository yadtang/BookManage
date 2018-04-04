package edu.fjnu.book.dao.impl;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.SysconfigDao;
import edu.fjnu.book.domain.Sysconfig;

@Repository
public class SysconfigDaoImpl extends BaseDaoImpl<Sysconfig> implements SysconfigDao{
	
	public SysconfigDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.SysconfigMapper.");			//设置命名空间
	}

	public Sysconfig getByName(String name) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(this.getNs()+"getByName",name);
	}
}
