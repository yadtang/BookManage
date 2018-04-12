package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fjnu.book.dao.BookDao;
import edu.fjnu.book.dao.LoveBookDao;
import edu.fjnu.book.domain.Book;
import edu.fjnu.book.domain.LoveBook;
import edu.fjnu.book.service.LoveBookService;
@Service
public class LoveBookServiceImpl implements LoveBookService{
	@Autowired
	LoveBookDao loveBookDao;
	@Autowired
	BookDao bookDao;
	
	public LoveBook get(Serializable id) {
		return loveBookDao.get(id);
	}

	public void insert(LoveBook loveBook) {
		//1.插入记录
		loveBookDao.insert(loveBook);
		//2.获取图书的总点赞数
		List<LoveBook> books = loveBookDao.find(loveBook);
		//3.更新点赞人数
		Book book = new Book();
		book.setBookid(loveBook.getBook().getBookid());
		book.setNumber(books.size());
		bookDao.update(book);
	}

	public void update(LoveBook loveBook) {
		loveBookDao.update(loveBook);
	}

	public void delete(Serializable id) {
		//1. 获得当前点赞信息
		LoveBook lBook = loveBookDao.get(id);
		//2.删除当前点赞信息
		loveBookDao.delete(id);
		//3.获取图书的当前总点赞数
		List<LoveBook> books = loveBookDao.find(lBook);
		//4.更新点赞人数
		Book book = new Book();
		book.setBookid(lBook.getBook().getBookid());
		book.setNumber(books.size());
		bookDao.update(book);
	}

	public void delete(Serializable[] ids) {
		loveBookDao.delete(ids);
	}

	public List<LoveBook> find(LoveBook loveBook) {
		return loveBookDao.find(loveBook);
	}

	public List<LoveBook> getByUser(LoveBook loveBook) {
		// TODO Auto-generated method stub
		return loveBookDao.getByUser(loveBook);
	}

	public LoveBook getByIds(LoveBook loveBook) {
		// TODO Auto-generated method stub
		return loveBookDao.getByIds(loveBook);
	}

}
