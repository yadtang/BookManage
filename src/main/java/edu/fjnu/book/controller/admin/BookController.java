package edu.fjnu.book.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;

import edu.fjnu.book.controller.BaseController;
import edu.fjnu.book.domain.Book;
import edu.fjnu.book.domain.BookType;
import edu.fjnu.book.domain.Mark;
import edu.fjnu.book.domain.MsgItem;
import edu.fjnu.book.domain.Publisher;
import edu.fjnu.book.service.BookService;
import edu.fjnu.book.service.BookTypeService;
import edu.fjnu.book.service.MarkService;
import edu.fjnu.book.service.PublisherService;
/**
 * 图书分类管理
 * @author hspcadmin
 *
 */
@Controller
public class BookController extends BaseController {
	@Autowired
	BookService bookService;
	@Autowired
	BookTypeService bookTypeService;
	@Autowired
	PublisherService publisherService;
	@Autowired
	MarkService markService;
	//获取所有的图书分类信息
	@RequestMapping("/admin/toBookPage.action")
	public String getAllBookInfo(@RequestParam(value="page", defaultValue="1") int page,
			Book book, Model model, HttpSession session){
		PageInfo<Book> pageInfo = bookService.findByPage(book, page, 5);
		List<Book> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/book-mgt.jsp";			
	}
	
	@RequestMapping("/admin/qryBookByPage.action")
	@ResponseBody
	public List<Book> qryBookByPage(@RequestParam(value="page", defaultValue="1") int page,
			Book book,Model model, HttpSession session){
		PageInfo<Book> pageInfo = bookService.findByPage(book, page, 5);
		List<Book> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return dataList;			
	}
	
	/**
	 * 跳转到分类详情页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toQryBookPage.action")
	public String toQryBookPage(int id,Model model, HttpSession session){
		Book book = bookService.get(id);
		model.addAttribute("book", book);
		return "/admin/book-qry.jsp";			
	}
	
	/**
	 * 跳转到图书信息修改页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toUpdBookPage.action")
	public String toUpdBookTypePage(int id,Model model, HttpSession session){
		Book book = bookService.get(String.valueOf(id));
		model.addAttribute("book", book);
		List<BookType> bookType = bookTypeService.find(new BookType());
		List<Publisher> publisher = publisherService.find(new Publisher());
		List<Mark> marks = markService.find(new Mark());
		model.addAttribute("marks", marks);
		model.addAttribute("bookType", bookType);
		model.addAttribute("publisher", publisher);
		return "/admin/book-upd.jsp";			
	}
	
	/**
	 * 跳转到添加图书信息页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toAddBookPage.action")
	public String toAddBookPage(Model model, HttpSession session){
		List<BookType> bookType = bookTypeService.find(new BookType());
		List<Publisher> publisher = publisherService.find(new Publisher());
		List<Mark> marks = markService.find(new Mark());
		model.addAttribute("marks", marks);
		model.addAttribute("bookType", bookType);
		model.addAttribute("publisher", publisher);
		return "/admin/book-reg.jsp";			
	}
	
	/**
	 * 修改图书信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/updateBook.action")
	@ResponseBody
	public MsgItem updateBook(Book book, String press,String typeId,Model model,MultipartFile file,HttpServletRequest request){
		MsgItem item = new MsgItem();
		try {
			String filename =file.getOriginalFilename();
			if(filename != null && !"".equals(filename.trim())){
				//原始文件名称
		    	
		    	//名称
		    	String newFileName=UUID.randomUUID().toString()+filename.substring(filename.lastIndexOf("."));
		    	String contexPath= request.getSession().getServletContext().getRealPath("/")+"book\\"+newFileName;
		    	System.out.println(contexPath);
		    	//上传图片
		    	File uploadPic=new File(contexPath);
		    	if(!uploadPic.exists()){
		    		uploadPic.mkdirs();
		    	}
		    	//向磁盘写入文件
		    	file.transferTo(uploadPic);
		    	//将图片的路径保存到user对象中
		    	book.setImageUrl("book/"+newFileName);
			}else{
				Book book1 = bookService.get(book.getBookid());
				book.setImageUrl(book1.getImageUrl());
			}
			//出版社
	    	Publisher publisher = new Publisher();
	    	publisher.setId(press);
	    	book.setPublisher(publisher);
	    	//图书分类
	    	BookType bookType = new BookType();
	    	bookType.setTypeId(Integer.parseInt(typeId));
	    	book.setBookType(bookType);
			bookService.update(book);
			item.setErrorNo("0");
			item.setErrorInfo("图书信息修改成功!");
		} catch (Exception e) {
			e.printStackTrace();
			item.setErrorNo("1");
			item.setErrorInfo("图书信息修改失败!");
		}
		
		return item;			
	}
	
	/**
	 * 添加图书信息
	 * @param category
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/admin/addBook.action")
	@ResponseBody
	public MsgItem addType(Book book, String press,String typeid,Model model,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
    	//原始文件名称
    	String filename =file.getOriginalFilename();
    	//性名称
    	String newFileName=UUID.randomUUID().toString()
    			+filename.substring(filename.lastIndexOf("."));
    	String contexPath= request.getSession().getServletContext().getRealPath("/")+"book\\"+newFileName;
    	System.out.println(contexPath);
    	//上传图片
    	File uploadPic=new File(contexPath);
    	//出版社
    	Publisher publisher = new Publisher();
    	publisher.setId(press);
    	book.setPublisher(publisher);
    	//图书分类
    	BookType bookType = new BookType();
    	bookType.setTypeId(Integer.parseInt(typeid));
    	book.setBookType(bookType);
    	if(!uploadPic.exists()){
    		uploadPic.mkdirs();
    	}
    	//向磁盘写入文件
    	file.transferTo(uploadPic);
    	//book.setPress("3");
    	//将图片的路径保存到user对象中
    	book.setImageUrl("book/"+newFileName);
		MsgItem item = new MsgItem();
		try {
			bookService.insert(book);
			item.setErrorNo("0");
			item.setErrorInfo("添加成功!");
		} catch (Exception e) {
			e.printStackTrace();
			item.setErrorNo("1");
			item.setErrorInfo("添加失败!");
		}
		
		return item;			
	}
	/**
	 * 删除图书信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/delBook.action")
	@ResponseBody
	public MsgItem delCate(String bookid, Model model){
		MsgItem item = new MsgItem();
		try {
			if(bookid != null && !"".equals(bookid.trim())){
				String ids[] = bookid.split(",");
				for(int i=0;i<ids.length;i++){
					bookService.delete(Integer.parseInt(ids[i]));
				}
			}
			item.setErrorNo("0");
			item.setErrorInfo("删除成功!");
		} catch (Exception e) {
			item.setErrorNo("1");
			item.setErrorInfo("删除失败!");
		}
		
		return item;			
	}
}
