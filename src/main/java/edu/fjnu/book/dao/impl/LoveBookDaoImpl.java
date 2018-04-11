package edu.fjnu.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.LoveBookDao;
import edu.fjnu.book.domain.LoveBook;
@Repository
public class LoveBookDaoImpl extends BaseDaoImpl<LoveBook> implements LoveBookDao {
	public LoveBookDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.LoveBookMapper.");			//设置命名空间
	}

	public List<LoveBook> getByUser(LoveBook loveBook) {
		return this.getSqlSession().selectList(this.getNs()+"getByUser",loveBook);
	}

	public LoveBook getByIds(LoveBook loveBook) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(this.getNs()+"getByIds",loveBook);
	}
}
