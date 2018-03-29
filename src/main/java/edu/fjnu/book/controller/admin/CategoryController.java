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
import edu.fjnu.book.domain.Category;
import edu.fjnu.book.domain.MsgItem;
import edu.fjnu.book.service.CategoryService;

/**
 * 书架分类管理
 * @author hspcadmin
 *
 */
@Controller
public class CategoryController extends BaseController {
	@Autowired
	CategoryService categoryService;
	
	//获取所有的书架分类信息
	@RequestMapping("/toCategoryPage.action")
	public String getAllUserInfo(@RequestParam(value="page", defaultValue="1") int page,
			Category category, Model model, HttpSession session){
		PageInfo<Category> pageInfo = categoryService.findByPage(category, page, 10);
		List<Category> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/cate-mgt.jsp";			
	}
	
	/**
	 * 跳转到分类详情页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toQryCategoryPage.action")
	public String toQryCategoryPage(int id,Model model, HttpSession session){
		Category category = categoryService.get(id);
		model.addAttribute("category", category);
		return "/admin/cate-qry.jsp";			
	}
	
	/**
	 * 跳转到分类信息修改页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toUpdCategoryPage.action")
	public String toUpdCategoryPage(int id,Model model, HttpSession session){
		Category category = categoryService.get(id);
		model.addAttribute("category", category);
		return "/admin/cate-upd.jsp";			
	}
	
	/**
	 * 跳转到添加分类信息页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toAddCategoryPage.action")
	public String toAddCategoryPage(Model model, HttpSession session){
		return "/admin/cate-reg.jsp";			
	}
	
	/**
	 * 修改分类信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/updateCate.action")
	@ResponseBody
	public MsgItem updateCate(Category category, Model model){
		MsgItem item = new MsgItem();
		try {
			categoryService.update(category);
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
	@RequestMapping("/admin/addCate.action")
	@ResponseBody
	public MsgItem addCate(Category category, Model model){
		MsgItem item = new MsgItem();
		if(category == null){
			item.setErrorNo("1");
			item.setErrorInfo("添加分类失败!");
			return item;
		}
		category.setStatus("1");
		try {
			categoryService.insert(category);
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
	@RequestMapping("/admin/delCate.action")
	@ResponseBody
	public MsgItem delCate(String cateId, Model model){
		MsgItem item = new MsgItem();
		try {
			if(cateId != null && !"".equals(cateId.trim())){
				String ids[] = cateId.split(",");
				for(int i=0;i<ids.length;i++){
					categoryService.delete(Integer.parseInt(ids[i]));
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
