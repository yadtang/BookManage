package edu.fjnu.book.dao.impl;

import edu.fjnu.book.dao.EvaluateDao;
import edu.fjnu.book.domain.Evaluate;

public class EvaluateDaoImpl extends BaseDaoImpl<Evaluate> implements EvaluateDao {
	public EvaluateDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.EvaluateMapper.");			//设置命名空间
	}
}
