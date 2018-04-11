package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.book.dao.BookDao;
import edu.fjnu.book.dao.EvaluateDao;
import edu.fjnu.book.domain.Book;
import edu.fjnu.book.domain.BookType;
import edu.fjnu.book.domain.Evaluate;
import edu.fjnu.book.domain.User;
import edu.fjnu.book.service.BookService;
import edu.fjnu.book.util.QRCodeUtil;
import edu.fjnu.book.util.TimeUtil;
@Service
public class BookServiceImpl implements BookService{
	@Autowired
	BookDao bookDao;
	@Autowired
	EvaluateDao evaluateDao;
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

	public List<Book> getBookByMark(Map<String,Object>map) {
		// TODO Auto-generated method stub
		return bookDao.getBookByMark(map);
	}

	public List<Book> getBookRank(Book book) {
		// TODO Auto-generated method stub
		return bookDao.getBookRank(book);
	}

	public List<Book> getBookByIds(Book book) {
		// TODO Auto-generated method stub
		return bookDao.getBookByIds(book);
	}

	public void updateScore(String userId,String bookid,int score,String content) {
		Evaluate evaluate = new Evaluate();
		User user = new User();
		user.setUserId(userId);
		evaluate.setBookid(bookid);
		evaluate.setUser(user);
		String time = TimeUtil.getCurrentTime();
		evaluate.setTime(time);
		evaluate.setScore(score);
		evaluate.setContent(content);
		//1.插入评价表
		evaluateDao.insert(evaluate);
		//2.得到平均分
		String avgScore = evaluateDao.getAvgByBook(evaluate);
		//3.将平均分插入图书表
		Book book = new Book();
		book.setBookid(bookid);
		book.setScore(avgScore);
		bookDao.update(book);
	}
}
