package edu.fjnu.book.dao.impl;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.MarkDao;
import edu.fjnu.book.domain.Mark;

@Repository
public class MarkDaoImpl extends BaseDaoImpl<Mark> implements MarkDao{
	
	public MarkDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.MarkMapper.");			//设置命名空间
	}
}
