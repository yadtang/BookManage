package edu.fjnu.book.controller.user;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;

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
import edu.fjnu.book.domain.MsgItem;
import edu.fjnu.book.domain.Sysconfig;
import edu.fjnu.book.domain.User;
import edu.fjnu.book.service.BookService;
import edu.fjnu.book.service.EvaluateService;
import edu.fjnu.book.util.MailUtils;
import edu.fjnu.book.util.QRCodeUtil;
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
	public MsgItem createImg(String id, Model model, ServletRequest servletRequest){
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		MsgItem item = new MsgItem();
		String contexPath= request.getSession().getServletContext().getRealPath("/")+"book\\dushu.jpg";
		String addr;
		try {
			addr = InetAddress.getLocalHost().getHostAddress();
			String url = "http://"+addr+":"+request.getServerPort()+request.getRequestURI()+"?id="+id;
			QRCodeUtil.encode(url, contexPath, contexPath, true);
			item.setErrorNo("0");
		} catch (Exception e) {
			e.printStackTrace();
			item.setErrorNo("1");
		}
		return item;
	}
}
