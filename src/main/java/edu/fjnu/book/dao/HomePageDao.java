package edu.fjnu.book.dao;

import java.io.Serializable;
import java.util.Map;

import edu.fjnu.book.domain.HomePage;

public interface HomePageDao extends BaseDao<HomePage>{
	/**删除t_pagebook表的数据*/
	public void delPageBook(Serializable id);
	public int getMaxId(HomePage homePage);
	public void insertPB(Map<String,Object>map);
}
