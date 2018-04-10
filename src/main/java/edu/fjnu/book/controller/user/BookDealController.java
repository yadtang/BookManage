package edu.fjnu.book.controller.user;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.fjnu.book.controller.BaseController;
import edu.fjnu.book.domain.Book;
import edu.fjnu.book.domain.Evaluate;
import edu.fjnu.book.service.BookService;
import edu.fjnu.book.service.EvaluateService;
/**
 * 图书处理Controller层
 * @author hspcadmin
 *
 */
@Controller
public class BookDealController extends BaseController {
	@Autowired
	EvaluateService evaluateService;
	@Autowired
	BookService bookService;
	//跳转到图书详情页面
	@RequestMapping("/user/bookInfo.action")
	public String bookInfo(String id, Model model, HttpSession session,ServletRequest servletRequest){
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		if(id != null && !"".equals(id.trim())){
			Book bk = bookService.get(id);
			bookService.updateTimes(bk);//更新访问次数
			Book book = bookService.get(id);
			model.addAttribute("book", book);
			Evaluate evaluate = new Evaluate();
			evaluate.setBookid(id);
			List<Evaluate> eval = evaluateService.find(evaluate);
			
			for(Evaluate eval1 : eval){
				eval1.setScore(eval1.getScore() * 12);
			}
			model.addAttribute("count", eval.size());//评论条数
			model.addAttribute("evaluate", eval);//评论内容
			Map<String,Object> map = evaluateService.getScoreProp(id);
			model.addAttribute("scoreMap", map);//评分分布
			try {
				String addr = InetAddress.getLocalHost().getHostAddress();
				model.addAttribute("reqUrl", "http://"+addr+":"+request.getServerPort()+request.getRequestURI()+"?id="+id);//评论内容
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "/user/bookinfo.jsp";			
	}
	
	/**
	 * 生成二维码图片
	 * @param user
	 * @param model
	 * @param servletRequest
	 * @return
	 */
	@RequestMapping("/user/createImg.action")
	@ResponseBody
	public Book createImg(String id, Model model, ServletRequest servletRequest){
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		String contexPath= request.getSession().getServletContext().getRealPath("/")+"book";
		String addr;
		Book book = bookService.get(id);
		try {
			addr = InetAddress.getLocalHost().getHostAddress();
			String url = "http://"+addr+":"+request.getServerPort()+"/Book/user/bookInfo.action?id="+id;
			bookService.createImg(id, contexPath, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return book;	
	}
}
