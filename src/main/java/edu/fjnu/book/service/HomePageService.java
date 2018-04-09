package edu.fjnu.book.service;

import java.io.Serializable;
import java.util.List;
import com.github.pagehelper.PageInfo;

import edu.fjnu.book.domain.HomePage;

public interface HomePageService {
	public List<HomePage> find(HomePage homePage);
	public HomePage get(Serializable id);
	public void insert(HomePage homePage);
	public void update(HomePage homePage);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	public void delBookInfo(Serializable id);
	/**分页查询分类信息*/
	public PageInfo<HomePage> findByPage(HomePage homePage, Integer pageNo,Integer pageSize);
	public void addPage(HomePage homePage,String id);
	public void updatePage(HomePage homePage,String id);
}
