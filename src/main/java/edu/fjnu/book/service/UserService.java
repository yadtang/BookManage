package edu.fjnu.book.service;

import java.io.Serializable;
import java.util.List;

import com.github.pagehelper.PageInfo;

import edu.fjnu.book.domain.User;

public interface UserService {
	public List<User> find(User user);
	/**查询所有待审核记录*/
	public List<User> findPending(User user);
	public User get(Serializable id);
	public void insert(User user);
	public void update(User user);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	public User login(User user);
	/**查询用户信息*/
	public User getStu(User user);
	/**分页查询用户信息*/
	public PageInfo<User> findByPage(User user, Integer pageNo,Integer pageSize);
	/**分页查询待审核记录*/
	public PageInfo<User> findPendingByPage(User user, Integer pageNo,Integer pageSize);
	public User getStuByEmail(User user);
}
