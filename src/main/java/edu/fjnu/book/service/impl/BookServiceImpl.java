package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.book.dao.BookDao;
import edu.fjnu.book.domain.Book;
import edu.fjnu.book.domain.BookType;
import edu.fjnu.book.service.BookService;
import edu.fjnu.book.util.QRCodeUtil;
import edu.fjnu.book.util.TimeUtil;
@Service
public class BookServiceImpl implements BookService{
	@Autowired
	BookDao bookDao;
	
	public Book get(Serializable id) {
		// TODO Auto-generated method stub
		return bookDao.get(id);
	}

	public void insert(Book book) {
		String time = TimeUtil.getTime();
		book.setTime(time);
		bookDao.insert(book);
	}

	public void update(Book book) {
		// TODO Auto-generated method stub
		bookDao.update(book);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		bookDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		bookDao.delete(ids);
	}

	public BookType getStu(BookType bookType) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageInfo<Book> findByPage(Book book, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Book> list = bookDao.find(book);
	    //用PageInfo对结果进行包装
	    PageInfo<Book> page = new PageInfo<Book>(list);
	    return page;
	}

	public Book getStu(Book book) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Book> getBookByType(Serializable id) {
		// TODO Auto-generated method stub
		return bookDao.getBookByType(id);
	}

	public void createImg(Serializable id, String path,String url) {
		try {
			QRCodeUtil.encode(url, path+"\\dushu.jpg", path, true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateTimes(Book book) {
		Book bk = bookDao.get(book.getBookid());
		int times = bk.getTimes();
		times++;
		book.setTimes(times);
		bookDao.update(book);
	}
}
