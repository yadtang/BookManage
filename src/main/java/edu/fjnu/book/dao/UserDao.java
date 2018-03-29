package edu.fjnu.book.dao;

import java.util.List;

import edu.fjnu.book.domain.User;


public interface UserDao extends BaseDao<User>{

	public List<User> findPending(User user);
	public User getStu(User user);
}
