package edu.fjnu.book.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.fjnu.book.controller.BaseController;
import edu.fjnu.book.service.EvaluateService;
/**
 * 评价管理
 * @author hspcadmin
 *
 */
@Controller
public class EvaluateController extends BaseController{
	@Autowired
	EvaluateService evaluateService;
	
	
}
