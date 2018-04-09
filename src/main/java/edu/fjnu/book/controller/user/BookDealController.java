package edu.fjnu.book.controller.user;

import java.util.List;

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
	public String bookInfo(String id, Model model, HttpSession session){
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
		}
		return "/user/bookinfo.jsp";			
	}
}
