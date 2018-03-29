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
import edu.fjnu.book.domain.BookType;
import edu.fjnu.book.domain.MsgItem;
import edu.fjnu.book.service.BookTypeService;
/**
 * 图书分类管理
 * @author hspcadmin
 *
 */
@Controller
public class BookTypeController extends BaseController {
	@Autowired
	BookTypeService bookTypeService;
	
	//获取所有的图书分类信息
	@RequestMapping("/toBookTypePage.action")
	public String getAllBookTypeInfo(@RequestParam(value="page", defaultValue="1") int page,
			BookType bookType, Model model, HttpSession session){
		PageInfo<BookType> pageInfo = bookTypeService.findByPage(bookType, page, 10);
		List<BookType> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/type-mgt.jsp";			
	}
	
	@RequestMapping("/qryBookTypeByPage.action")
	@ResponseBody
	public List<BookType> qryBookTypeByPage(@RequestParam(value="page", defaultValue="1") int page,
			BookType bookType,Model model, HttpSession session){
		PageInfo<BookType> pageInfo = bookTypeService.findByPage(bookType, page, 10);
		List<BookType> dataList = pageInfo.getList();
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
	@RequestMapping("/toQryBookTypePage.action")
	public String toQryBookTypePage(int id,Model model, HttpSession session){
		BookType bookType = bookTypeService.get(id);
		model.addAttribute("bookType", bookType);
		return "/admin/type-qry.jsp";			
	}
	
	/**
	 * 跳转到分类信息修改页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toUpdBookTypePage.action")
	public String toUpdBookTypePage(int id,Model model, HttpSession session){
		BookType bookType = bookTypeService.get(id);
		model.addAttribute("bookType", bookType);
		return "/admin/type-upd.jsp";			
	}
	
	/**
	 * 跳转到添加分类信息页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toAddBookTypePage.action")
	public String toAddBookTypePage(Model model, HttpSession session){
		return "/admin/type-reg.jsp";			
	}
	
	/**
	 * 修改分类信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/updateType.action")
	@ResponseBody
	public MsgItem updateCate(BookType bookType, Model model){
		MsgItem item = new MsgItem();
		try {
			bookTypeService.update(bookType);
			item.setErrorNo("0");
			item.setErrorInfo("分类信息修改成功!");
		} catch (Exception e) {
			item.setErrorNo("1");
			item.setErrorInfo("分类信息修改失败!");
		}
		
		return item;			
	}
	
	/**
	 * 添加分类信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/addType.action")
	@ResponseBody
	public MsgItem addType(BookType bookType, Model model){
		MsgItem item = new MsgItem();
		if(bookType == null){
			item.setErrorNo("1");
			item.setErrorInfo("添加分类失败!");
			return item;
		}
		bookType.setStatus("1");
		try {
			bookTypeService.insert(bookType);
			item.setErrorNo("0");
			item.setErrorInfo("添加分类成功!");
		} catch (Exception e) {
			item.setErrorNo("1");
			item.setErrorInfo("添加分类失败!");
		}
		
		return item;			
	}
	/**
	 * 删除分类信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/delType.action")
	@ResponseBody
	public MsgItem delCate(String typeId, Model model){
		MsgItem item = new MsgItem();
		try {
			if(typeId != null && !"".equals(typeId.trim())){
				String ids[] = typeId.split(",");
				for(int i=0;i<ids.length;i++){
					bookTypeService.delete(Integer.parseInt(ids[i]));
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
