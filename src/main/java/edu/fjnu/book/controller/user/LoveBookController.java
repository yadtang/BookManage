package edu.fjnu.book.controller.user;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.fjnu.book.controller.BaseController;
import edu.fjnu.book.domain.Evaluate;
import edu.fjnu.book.domain.LoveBook;
import edu.fjnu.book.service.EvaluateService;
import edu.fjnu.book.service.LoveBookService;
/**
 * 喜爱的图书Controller层
 * @author hspcadmin
 *
 */
@Controller
public class LoveBookController extends BaseController {
	@Autowired
	LoveBookService loveBookService;
	@Autowired
	EvaluateService evaluateService;
	
	@RequestMapping("/user/qryLoveBook.action")
	public String qryLoveBook(String userId, Model model, ServletRequest servletRequest){
		LoveBook loveBook = new LoveBook();
		loveBook.setUserId(userId);
		List<LoveBook> LoveBooks = loveBookService.getByUser(loveBook);
		for(LoveBook lBook : LoveBooks){
			Evaluate evaluate = new Evaluate();
			evaluate.setBookid(lBook.getBook().getBookid());
			List<Evaluate> eval = evaluateService.find(evaluate);
			lBook.setRemark(eval.size()+"");
		}
		model.addAttribute("LoveBooks", LoveBooks);
		model.addAttribute("count", LoveBooks.size());
		return "/user/love.jsp";
	}
}
