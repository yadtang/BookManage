package edu.fjnu.book.dao.impl;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.EvaluateDao;
import edu.fjnu.book.domain.Evaluate;
@Repository
public class EvaluateDaoImpl extends BaseDaoImpl<Evaluate> implements EvaluateDao {
	public EvaluateDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.EvaluateMapper.");			//设置命名空间
	}

	public String getAvgByBook(Evaluate evaluate) {
		return this.getSqlSession().selectOne(this.getNs() + "getAvgByBook",evaluate);
	}
}
