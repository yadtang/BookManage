package edu.fjnu.book.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;

import edu.fjnu.book.domain.Book;

public interface BookService {
	public Book get(Serializable id);
	public void insert(Book book);
	public void update(Book book);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	/**查询分页信息*/
	public Book getStu(Book book);
	/**分页查询分类信息*/
	public PageInfo<Book> findByPage(Book book, Integer pageNo,Integer pageSize);
	public List<Book> getBookByType(Serializable id);
	//生成二维码
	public void createImg(Serializable id,String path,String url);
	//更新访问次数
	public void updateTimes(Book book);
	public List<Book> getBookByMark(Map<String,Object>map);
	//获取人气排行榜
	public List<Book> getBookRank(Book book);
}
