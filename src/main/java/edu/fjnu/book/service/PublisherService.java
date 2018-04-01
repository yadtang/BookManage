package edu.fjnu.book.service;

import java.io.Serializable;
import java.util.List;

import com.github.pagehelper.PageInfo;

import edu.fjnu.book.domain.Publisher;

public interface PublisherService {
	public List<Publisher> find(Publisher publisher);
	public Publisher get(Serializable id);
	public void insert(Publisher publisher);
	public void update(Publisher publisher);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	/**查询分页信息*/
	public Publisher getStu(Publisher publisher);
	/**分页查询分类信息*/
	public PageInfo<Publisher> findByPage(Publisher publisher, Integer pageNo,Integer pageSize);
}
