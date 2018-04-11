package edu.fjnu.book.dao;

import edu.fjnu.book.domain.Evaluate;

public interface EvaluateDao extends BaseDao<Evaluate> {
	/**获得图书的平均分*/
	public String getAvgByBook(Evaluate evaluate);
}
