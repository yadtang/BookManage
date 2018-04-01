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
import edu.fjnu.book.domain.MsgItem;
import edu.fjnu.book.domain.Publisher;
import edu.fjnu.book.service.PublisherService;
/**
 * 出版社管理
 * @author hspcadmin
 *
 */
@Controller
public class PublisherController extends BaseController {
	@Autowired
	PublisherService publisherService;
	
	//获取所有的图书分类信息
	@RequestMapping("/admin/toPublisherPage.action")
	public String getAllPublisherInfo(@RequestParam(value="page", defaultValue="1") int page,
			Publisher publisher, Model model, HttpSession session){
		PageInfo<Publisher> pageInfo = publisherService.findByPage(publisher, page, 10);
		List<Publisher> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/pub-mgt.jsp";			
	}
	
	@RequestMapping("/admin/qryPublisherByPage.action")
	@ResponseBody
	public List<Publisher> qryPublisherByPage(@RequestParam(value="page", defaultValue="1") int page,
			Publisher publisher,Model model, HttpSession session){
		PageInfo<Publisher> pageInfo = publisherService.findByPage(publisher, page, 10);
		List<Publisher> dataList = pageInfo.getList();
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
	@RequestMapping("/admin/toQryPublisherPage.action")
	public String toQryPublisherPage(int id,Model model, HttpSession session){
		Publisher publisher = publisherService.get(id);
		model.addAttribute("publisher", publisher);
		return "/admin/pub-qry.jsp";			
	}
	
	/**
	 * 跳转到分类信息修改页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toUpdPublisherPage.action")
	public String toUpdPublisherPage(int id,Model model, HttpSession session){
		Publisher publisher = publisherService.get(id);
		model.addAttribute("publisher", publisher);
		return "/admin/pub-upd.jsp";			
	}
	
	/**
	 * 跳转到添加分类信息页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toAddPublisherPage.action")
	public String toAddPublisherPage(Model model, HttpSession session){
		return "/admin/pub-reg.jsp";			
	}
	
	/**
	 * 修改分类信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/updatePub.action")
	@ResponseBody
	public MsgItem updatePub(Publisher publisher, Model model){
		MsgItem item = new MsgItem();
		try {
			publisherService.update(publisher);
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
	@RequestMapping("/admin/addPub.action")
	@ResponseBody
	public MsgItem addPub(Publisher publisher, Model model){
		MsgItem item = new MsgItem();
		if(publisher == null){
			item.setErrorNo("1");
			item.setErrorInfo("添加分类失败!");
			return item;
		}
		publisher.setStatus("1");
		try {
			publisherService.insert(publisher);
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
	@RequestMapping("/admin/delPub.action")
	@ResponseBody
	public MsgItem delPub(String id, Model model){
		MsgItem item = new MsgItem();
		try {
			if(id != null && !"".equals(id.trim())){
				String ids[] = id.split(",");
				for(int i=0;i<ids.length;i++){
					publisherService.delete(Integer.parseInt(ids[i]));
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
