package edu.fjnu.book.service;

import java.io.Serializable;
import java.util.List;
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
}
