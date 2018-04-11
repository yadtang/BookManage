package edu.fjnu.book.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;

import edu.fjnu.book.domain.Evaluate;

public interface EvaluateService {
	public List<Evaluate> find(Evaluate evaluate);
	public Evaluate get(Serializable id);
	public void insert(Evaluate evaluate);
	public void update(Evaluate evaluate);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	/**分页查询分类信息*/
	public PageInfo<Evaluate> findByPage(Evaluate evaluate, Integer pageNo,Integer pageSize);
	//计算评分分布
	public Map<String,Object> getScoreProp(Serializable bookid);
	/**获得图书的平均分*/
	public int getAvgByBook(Evaluate evaluate);
}
