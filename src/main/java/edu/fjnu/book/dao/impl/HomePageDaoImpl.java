package edu.fjnu.book.dao.impl;

import java.io.Serializable;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.HomePageDao;
import edu.fjnu.book.domain.HomePage;

@Repository
public class HomePageDaoImpl extends BaseDaoImpl<HomePage> implements HomePageDao{
	
	public HomePageDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.HomePageMapper.");			//设置命名空间
	}

	public void delPageBook(Serializable id) {
		this.getSqlSession().delete(this.getNs() + "delPageBook", id);
	}

	public int getMaxId(HomePage homePage) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(this.getNs() + "getMaxId",homePage);
	}

	public void insertPB(Map<String, Object> map) {
		// TODO Auto-generated method stub
		this.getSqlSession().insert(this.getNs() + "insertPB", map);
	}

}
