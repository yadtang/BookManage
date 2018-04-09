package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.book.dao.HomePageDao;
import edu.fjnu.book.domain.Category;
import edu.fjnu.book.domain.HomePage;
import edu.fjnu.book.domain.PageBook;
import edu.fjnu.book.service.HomePageService;

@Service
public class HomePageServiceImpl implements HomePageService {
	@Autowired
	HomePageDao homePageDao;
	public List<HomePage> find(HomePage homePage) {
		// TODO Auto-generated method stub
		return homePageDao.find(homePage);
	}

	public HomePage get(Serializable id) {
		// TODO Auto-generated method stub
		return homePageDao.get(id);
	}

	public void insert(HomePage homePage) {
		// TODO Auto-generated method stub
		homePageDao.insert(homePage);
	}

	public void update(HomePage homePage) {
		// TODO Auto-generated method stub
		homePageDao.update(homePage);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		homePageDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		homePageDao.delete(ids);
	}

	public PageInfo<HomePage> findByPage(HomePage homePage, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<HomePage> list = homePageDao.find(homePage);
	    //用PageInfo对结果进行包装
	    PageInfo<HomePage> page = new PageInfo<HomePage>(list);
	    return page;
	}

	public void delBookInfo(Serializable id) {
		// TODO Auto-generated method stub
		homePageDao.delete(id);
		homePageDao.delPageBook(id);
	}

	public void addPage(HomePage homePage, String id) {
		PageBook pageBook = new PageBook();
		pageBook.setPageid(1);
		homePage.setPageBook(pageBook);
		homePageDao.insert(homePage);
		int pageid = homePageDao.getMaxId(homePage);
		pageBook.setPageid(pageid);
		Map<String, Object> map = new HashMap<String, Object>();
		if(id != null && !"".equals(id.trim())){
			String ids[] = id.split(",");
			for(int i=0;i<ids.length;i++){
				map.put("pageid", pageid);
				map.put("bookid", ids[i]);
				map.put("remark", homePage.getRemark());
				homePageDao.insertPB(map);
				homePage.setPageBook(pageBook);
			}
		}
	}

	public void updatePage(HomePage homePage, String id) {
		//更新t_homepage
		homePageDao.update(homePage);
		//删除t_pagebook级联数据
		homePageDao.delPageBook(homePage.getId());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageid", homePage.getId());
		map.put("remark", homePage.getRemark());
		if(id != null && !"".equals(id.trim())){
			String ids[] = id.split(",");
			for(int i=0;i<ids.length;i++){
				map.put("bookid", ids[i]);
				homePageDao.insertPB(map);
			}
		}
	}

}
