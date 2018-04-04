package edu.fjnu.book.service;

import java.io.Serializable;
import java.util.List;

import com.github.pagehelper.PageInfo;

import edu.fjnu.book.domain.Sysconfig;

public interface SysconfigService {
	public List<Sysconfig> find(Sysconfig sysconfig);
	public Sysconfig get(Serializable id);
	public void insert(Sysconfig sysconfig);
	public void update(Sysconfig sysconfig);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	/**分页查询分类信息*/
	public PageInfo<Sysconfig> findByPage(Sysconfig sysconfig, Integer pageNo,Integer pageSize);
	
	public Sysconfig getByName(String name);
}
