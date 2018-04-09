package edu.fjnu.book.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import edu.fjnu.book.controller.BaseController;
import edu.fjnu.book.domain.Book;
import edu.fjnu.book.domain.BookType;
import edu.fjnu.book.domain.HomePage;
import edu.fjnu.book.domain.MsgItem;
import edu.fjnu.book.domain.Publisher;
import edu.fjnu.book.service.BookService;
import edu.fjnu.book.service.BookTypeService;
import edu.fjnu.book.service.HomePageService;
/**
 * 首页管理
 * @author hspcadmin
 *
 */
@Controller
public class HomePageController extends BaseController {
	@Autowired
	HomePageService homePageService;
	@Autowired
	BookTypeService bookTypeService;
	@Autowired
	BookService bookService;
	private int typeId;
	//跳转到首页管理主页
	@RequestMapping("/admin/toHomePagePage.action")
	public String getAllHomePageInfo(@RequestParam(value="page", defaultValue="1") int page,
			HomePage homePage, Model model, HttpSession session){
		PageInfo<HomePage> pageInfo = homePageService.findByPage(homePage, page, 1000);
		List<HomePage> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getSize());
		return "/admin/page-mgt.jsp";			
	}
	
	@RequestMapping("/admin/qryHomePageByPage.action")
	@ResponseBody
	public List<HomePage> qryHomePageByPage(@RequestParam(value="page", defaultValue="1") int page,
			HomePage homePage,Model model, HttpSession session){
		PageInfo<HomePage> pageInfo = homePageService.findByPage(homePage, page, 10);
		List<HomePage> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageSize", pageInfo.getSize());
		return dataList;			
	}
	
	@RequestMapping("/admin/getBookByType.action")
	@ResponseBody
	public List<Book> getBookByType(String id,Model model, HttpSession session){
		List<Book> dataList = bookService.getBookByType(id);
		model.addAttribute("bookByType", dataList);
		return dataList;			
	}
	
	/**
	 * 跳转到分类详情页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toQryHomePagePage.action")
	public String toQryHomePagePage(int id,Model model, HttpSession session){
		HomePage homePage = homePageService.get(id);
		model.addAttribute("homePage", homePage);
		return "/admin/page-qry.jsp";			
	}
	
	/**
	 * 跳转到分类信息修改页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toUpdHomePagePage.action")
	public String toUpdHomePagePage(int id,Model model, HttpSession session){
		HomePage homePage = homePageService.get(id);
		List<Book> book = homePage.getPageBook().getBook();
		String typeId ="";
		for(Book bk : book){
			typeId = bk.getBookType().getTypeId() + "";
		}
		model.addAttribute("homePage", homePage);
		model.addAttribute("typeId", typeId);
		List<BookType> bookType = bookTypeService.find(new BookType());
		model.addAttribute("bookType", bookType);
		return "/admin/page-upd.jsp";			
	}
	
	/**
	 * 跳转到添加分类信息页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toAddHomePagePage.action")
	public String toAddHomePagePage(Model model, HttpSession session){
		List<BookType> bookType = bookTypeService.find(new BookType());
		model.addAttribute("bookType", bookType);
		return "/admin/page-reg.jsp";			
	}
	
	/**
	 * 修改分类信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/updatePage.action")
	@ResponseBody
	public MsgItem updatePage(HomePage homePage,String bookid, Model model){
		MsgItem item = new MsgItem();
		if(homePage == null || bookid == null || "".equals(bookid.trim())){
			item.setErrorNo("1");
			item.setErrorInfo("更新失败!");
			return item;
		}
		try {
			homePageService.updatePage(homePage, bookid);
			item.setErrorNo("0");
			item.setErrorInfo("更新成功!");
		} catch (Exception e) {
			e.printStackTrace();
			item.setErrorNo("1");
			item.setErrorInfo("更新失败!");
		}
		
		return item;			
	}
	
	/**
	 * 添加分类信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/addPage.action")
	@ResponseBody
	public MsgItem addPage(HomePage homePage,String bookid, Model model){
		MsgItem item = new MsgItem();
		if(homePage == null || bookid == null || "".equals(bookid.trim())){
			item.setErrorNo("1");
			item.setErrorInfo("添加首页失败!");
			return item;
		}
		try {
			homePageService.addPage(homePage, bookid);
			item.setErrorNo("0");
			item.setErrorInfo("添加首页成功!");
		} catch (Exception e) {
			e.printStackTrace();
			item.setErrorNo("1");
			item.setErrorInfo("添加首页失败!");
		}
		
		return item;			
	}
	/**
	 * 删除分类信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/delPage.action")
	@ResponseBody
	public MsgItem delPage(String pageId, Model model){
		MsgItem item = new MsgItem();
		try {
			if(pageId != null && !"".equals(pageId.trim())){
				String ids[] = pageId.split(",");
				for(int i=0;i<ids.length;i++){
					homePageService.delBookInfo(Integer.parseInt(ids[i]));
				}
			}
			item.setErrorNo("0");
			item.setErrorInfo("删除成功!");
		} catch (Exception e) {
			e.printStackTrace();
			item.setErrorNo("1");
			item.setErrorInfo("删除失败!");
		}
		
		return item;			
	}
}
