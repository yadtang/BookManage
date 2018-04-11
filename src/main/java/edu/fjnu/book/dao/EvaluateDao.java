package edu.fjnu.book.dao;

import java.util.List;

import edu.fjnu.book.domain.Evaluate;

public interface EvaluateDao extends BaseDao<Evaluate> {
	/**获得图书的平均分*/
	public String getAvgByBook(Evaluate evaluate);
	/**查询所有的评论信息*/
	public List<Evaluate> findAll(Evaluate evaluate);
}
