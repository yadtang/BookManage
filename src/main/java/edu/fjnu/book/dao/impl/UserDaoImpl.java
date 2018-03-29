package edu.fjnu.book.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.fjnu.book.dao.UserDao;
import edu.fjnu.book.domain.User;
@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{
	public UserDaoImpl() {
		this.setNs("edu.fjnu.book.mapper.UserMapper.");			//设置命名空间
	}

	public List<User> findPending(User user) {
		return this.getSqlSession().selectList(this.getNs()+"findPending",user);
	}

	public User getStu(User user) {
		return this.getSqlSession().selectOne(this.getNs()+"getStu",user);
	}

}
