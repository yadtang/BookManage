package edu.fjnu.book.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import edu.fjnu.book.controller.BaseController;
import edu.fjnu.book.domain.MsgItem;
import edu.fjnu.book.domain.User;
import edu.fjnu.book.service.UserService;
import edu.fjnu.book.util.MD5Util;
/**
 * 用户管理
 * @author hspcadmin
 *
 */
@Controller
public class UserController extends BaseController{

	@Autowired
	UserService userService;

	//跳转到登录页面
	@RequestMapping("/admin/login.action")
	public String toLoin(User user, Model model, HttpSession session){
		if(session.getAttribute("userName")!= null){
			return "/admin/index.jsp";
		}
		List<User> dataList = userService.find(user);
		model.addAttribute("dataList", dataList);
		return "/admin/login.jsp";			
	}
	
	@RequestMapping("/admin/userLogin.action")
	public String checkUser(User user, Model model, HttpSession session){
		User loginUser = userService.login(user);
		
		if(session.getAttribute("userName")!= null){
			return "/admin/index.jsp";
		}
		
		if(loginUser!=null && "2".equals(loginUser.getUserType())){
			session.setAttribute("userName", loginUser.getUserName());
			return "/admin/index.jsp";
		}else{
			model.addAttribute("message", "用户名或密码输入错误！！！");
			return "/admin/login.jsp";
		}
	}
	
	/**
	 * 判断账户信息是否存在
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/checkAccount.action")
	public String checkAccount(String userId, Model model){
		User userInfo = userService.get(userId);
		if(userInfo!= null){
			model.addAttribute("message", "该账号已经存在");
		}else{
			model.addAttribute("message", "<font color='green'>验证通过</font>");
		}
		model.addAttribute("userId", userId);
		return "/admin/info-reg.jsp";
	}
	
	@RequestMapping("/admin/checkEamil.action")
	@ResponseBody
	public MsgItem checkEamil(String email, Model model){
		MsgItem msgItem = new MsgItem();
		User register = new User();
		register.setEmail(email);
		User userInfo = userService.getStuByEmail(register);
		if(userInfo!= null){
			msgItem.setErrorNo("1");
			msgItem.setErrorInfo("<font color='red' style='font-weight:bold'>账号已经存在</font>");
		}else{
			msgItem.setErrorNo("0");
			msgItem.setErrorInfo("<font color='blue' style='font-weight:bold'>验证通过</font>");
		}
		return msgItem;
	} 
	
	/**
	 * ajax验证用户账号是否存在
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/userRegist.action")
	@ResponseBody
	public MsgItem userRegist(String userId, Model model, HttpSession session){
		MsgItem msgItem = new MsgItem();
		User user = userService.get(userId);
		if(user!=null){
			msgItem.setErrorNo("1");
			msgItem.setErrorInfo("<font color='red' style='font-weight:bold'>账号已经存在</font>");
		}else{
			msgItem.setErrorNo("0");
			msgItem.setErrorInfo("<font color='blue' style='font-weight:bold'>验证通过</font>");
		}
		return msgItem;
	} 
	
	//跳转到登录页面
	@RequestMapping("/admin/exitSys.action")
	public String exitSys(User user, Model model, HttpSession session){
		if(session.getAttribute("userName")!= null){
			session.removeAttribute("userName");
			return "forward:/admin/login.action";
		}
		return "/admin/login.jsp";			
	}
	
	//跳转到用户管理页面
	@RequestMapping(value="/admin/toUserManage.action",method=RequestMethod.POST)
	public String toUserManage(Model model, HttpSession session){
		return "/admin/user-mgt.jsp";			
	}
	
	//获取所有的用户信息
	@RequestMapping("/admin/getAllUser.action")
	public String getAllUserInfo(@RequestParam(value="page", defaultValue="1") int page,
			User user, Model model, HttpSession session){
//		List<User> dataList = userService.find(user);
		PageInfo<User> pageInfo = userService.findByPage(user, page, 10);
		List<User> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/user-mgt.jsp";			
	}
	
	//获取所有的用户信息
	@RequestMapping("/admin/qryAllUser.action")
	@ResponseBody
	public List<User> qryAllUser(@RequestParam(value="page", defaultValue="1") int page,
			User user, Model model, HttpSession session){
		PageInfo<User> pageInfo = userService.findByPage(user, page, 10);
		List<User> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return dataList;			
	}
	
	
	/**
	 * 添加用户信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/addUser.action")
	public String addUser(User user, Model model){
		userService.insert(user);
		return "redirect:/admin/getAllUser.action";			
	}
	
	/**
	 * 注销用户信息
	 * @param userId	用户账号，删除多个是，id用逗号分隔开
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/deleteUser.action")
	@ResponseBody
	public MsgItem deleteUser(String userId, Model model){
		MsgItem item = new MsgItem();
		try {
			if(userId != null && !"".equals(userId.trim())){
				String ids[] = userId.split(",");
				for(int i=0;i<ids.length;i++){
					userService.delete(ids[i]);
				}
			}
			item.setErrorNo("0");
			item.setErrorInfo("注销成功!");
		} catch (Exception e) {
			e.printStackTrace();
			item.setErrorNo("1");
			item.setErrorInfo("注销失败!");
		}
		
		return item;
	} 
	
	/**
	 * 跳转到更新用户信息页面
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toUpdateUser.action")
	public String toUpdateUser(User user, Model model, HttpSession session){
		String userId = user.getUserId().trim();
		User userInfo = userService.get(userId);
		model.addAttribute("user", userInfo);
		return "/admin/user-upd.jsp";			
	}
	
	/**
	 * 跳转到用户详情页面
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toQryUser.action")
	public String toQryUser(User user, Model model, HttpSession session){
		String userId = user.getUserId().trim();
		User userInfo = userService.get(userId);
		model.addAttribute("user", userInfo);
		return "/admin/user-qry.jsp";			
	}
	
	/**
	 * 更新用户信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/updateUser.action")
	@ResponseBody
	public MsgItem updateUser(User user, Model model){
		MsgItem item = new MsgItem();
		try {
			if(user != null){
				userService.update(user);
				item.setErrorNo("0");
				item.setErrorInfo("更新成功!");
			}else{
				item.setErrorNo("1");
				item.setErrorInfo("更新失败!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			item.setErrorNo("1");
			item.setErrorInfo("更新失败!");
		}
		
		return item;
	}
	
	/**
	 * 用户解冻
	 * @param userId	
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/thawUserById.action")
	@ResponseBody
	public MsgItem thawUserById(User user, Model model){
		MsgItem item = new MsgItem();
		user.setUserState("2");
		try {
			userService.update(user);
			item.setErrorNo("0");
			item.setErrorInfo("解冻成功!");
		} catch (Exception e) {
			e.printStackTrace();
			item.setErrorNo("1");
			item.setErrorInfo("解冻失败!");
		}
		
		return item;
	} 
	
	/**
	 * 用户解冻
	 * @param userId	
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/reSetPwd.action")
	@ResponseBody
	public MsgItem reSetPwd(String userId, Model model){
		MsgItem item = new MsgItem();
		try {
			if(userId != null && !"".equals(userId.trim())){
				String pwd = MD5Util.getData("123456");
				String ids[] = userId.split(",");
				for(int i=0;i<ids.length;i++){
					User user = new User();
					user.setUserId(ids[i]);
					user.setUserPwd(pwd);
					userService.update(user);
				}
			}
			item.setErrorNo("0");
			item.setErrorInfo("密码重置成功!");
		} catch (Exception e) {
			e.printStackTrace();
			item.setErrorNo("1");
			item.setErrorInfo("密码重置成功!");
		}
		
		return item;
	} 
	
}
