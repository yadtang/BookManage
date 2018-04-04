package edu.fjnu.book.dao;

import edu.fjnu.book.domain.Sysconfig;

public interface SysconfigDao extends BaseDao<Sysconfig>{
	public Sysconfig getByName(String name);
}
