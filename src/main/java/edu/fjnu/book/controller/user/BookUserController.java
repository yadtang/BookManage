package edu.fjnu.book.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.fjnu.book.controller.BaseController;
import edu.fjnu.book.domain.User;
import edu.fjnu.book.service.UserService;

/**
 * 前台用户Controller
 * @author hspcadmin
 *
 */
@Controller
public class BookUserController extends BaseController {
	@Autowired
	UserService userService;
	
	//跳转到登录页面
	@RequestMapping("/user/login.action")
	public String toLoinPage(User user, Model model, HttpSession session){
		return "/user/login.jsp";			
	}
	
	/**
	 * 前台用户登录
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/user/userLogin.action")
	public String userLogin(User user, Model model, HttpSession session){
		User loginUser = userService.login(user);
		
		if(session.getAttribute("userName")!= null){
			return "/admin/index.jsp";
		}
		
		if(loginUser!=null && "1".equals(loginUser.getUserType())){
			session.setAttribute("userName", loginUser.getUserName());
			return "/user/index.jsp";
		}else{
			model.addAttribute("message", "用户名或密码输入错误！！！");
			return "/user/login.jsp";
		}
	}
}
