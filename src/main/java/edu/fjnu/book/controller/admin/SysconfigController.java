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
import edu.fjnu.book.domain.Sysconfig;
import edu.fjnu.book.service.SysconfigService;
import edu.fjnu.book.util.MD5Util;
import edu.fjnu.book.util.MailUtils;
/**
 * 系统配置管理
 * @author hspcadmin
 *
 */
@Controller
public class SysconfigController extends BaseController {
	@Autowired
	SysconfigService sysconfigService;
	
	//获取所有的配置信息
	@RequestMapping("/admin/toSysconfPage.action")
	public String toSysconfPage(@RequestParam(value="page", defaultValue="1") int page,
			Sysconfig sysconfig, Model model, HttpSession session){
		PageInfo<Sysconfig> pageInfo = sysconfigService.findByPage(sysconfig, page, 12);
		List<Sysconfig> dataList = pageInfo.getList();
		for(Sysconfig conf : dataList){
			if("ADMIN_EMAIL_PWD".equals(conf.getParamName())){
				conf.setParamValue(MD5Util.getData(conf.getParamValue()));
			}
		}
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/conf-mgt.jsp";			
	}
	
	@RequestMapping("/admin/qrySysconfigByPage.action")
	@ResponseBody
	public List<Sysconfig> qrySysconfigByPage(@RequestParam(value="page", defaultValue="1") int page,
			Sysconfig sysconfig,Model model, HttpSession session){
		PageInfo<Sysconfig> pageInfo = sysconfigService.findByPage(sysconfig, page, 12);
		List<Sysconfig> dataList = pageInfo.getList();
		for(Sysconfig conf : dataList){
			if("ADMIN_EMAIL_PWD".equals(conf.getParamName())){
				conf.setParamValue(MD5Util.getData(conf.getParamValue()));
			}
		}
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
	@RequestMapping("/admin/toQrySysconfigPage.action")
	public String toQrySysconfigPage(int id,Model model, HttpSession session){
		Sysconfig sysconfig = sysconfigService.get(id);
		if("ADMIN_EMAIL_PWD".equals(sysconfig.getParamName())){
			sysconfig.setParamValue(MD5Util.getData(sysconfig.getParamValue()));
		}
		model.addAttribute("sysconfig", sysconfig);
		return "/admin/conf-qry.jsp";			
	}
	
	/**
	 * 跳转到分类信息修改页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toUpdSysconfigPage.action")
	public String toUpdSysconfigPage(int id,Model model, HttpSession session){
		Sysconfig sysconfig = sysconfigService.get(id);
		if("ADMIN_EMAIL_PWD".equals(sysconfig.getParamName())){
			sysconfig.setParamValue(MD5Util.getData(sysconfig.getParamValue()));
		}
		model.addAttribute("sysconfig", sysconfig);
		return "/admin/conf-upd.jsp";			
	}
	
	/**
	 * 跳转到添加分类信息页面
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toAddSysconfigPage.action")
	public String toAddSysconfigPage(Model model, HttpSession session){
		return "/admin/conf-reg.jsp";			
	}
	
	/**
	 * 修改分类信息
	 * @param category
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/updateConf.action")
	@ResponseBody
	public MsgItem updateConf(Sysconfig sysconfig, Model model){
		MsgItem item = new MsgItem();
		try {
			sysconfigService.update(sysconfig);
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
	@RequestMapping("/admin/addConf.action")
	@ResponseBody
	public MsgItem addConf(Sysconfig sysconfig, Model model){
		MsgItem item = new MsgItem();
		if(sysconfig == null){
			item.setErrorNo("1");
			item.setErrorInfo("添加分类失败!");
			return item;
		}
		sysconfig.setStatus("1");
		try {
			sysconfigService.insert(sysconfig);
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
	@RequestMapping("/admin/delConf.action")
	@ResponseBody
	public MsgItem delCate(String id, Model model){
		MsgItem item = new MsgItem();
		try {
			if(id != null && !"".equals(id.trim())){
				String ids[] = id.split(",");
				for(int i=0;i<ids.length;i++){
					sysconfigService.delete(Integer.parseInt(ids[i]));
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
	
	/**
	 * 发送邮件
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/sendEmail.action")
	@ResponseBody
	public MsgItem sendEmail(String email, Model model){
		MsgItem item = new MsgItem();
		try {
			Sysconfig conf = sysconfigService.get("ADMIN_EMAIL_ACCOUNT");
			Sysconfig conf1 = sysconfigService.get("ADMIN_EMAIL_PWD");
			if(conf!=null && conf1 !=null){
				MailUtils.sendMail(conf.getParamValue(), conf1.getParamValue(), email, "这是一封测试邮件");
				item.setErrorNo("0");
				item.setErrorInfo("发送成功!");
			}else{
				item.setErrorNo("1");
				item.setErrorInfo("发送失败!");
			}
			
		} catch (Exception e) {
			item.setErrorNo("1");
			item.setErrorInfo("发送失败!");
		}
		return item;			
	}
	
	//验证参数名称是否已经存在
	@RequestMapping("/admin/checkConfName.action")
	@ResponseBody
	public MsgItem checkConfName(String name, Model model){
		MsgItem item = new MsgItem();
		Sysconfig conf = sysconfigService.getByName(name);
		if(conf != null){
			item.setErrorNo("1");
			item.setErrorInfo("参数名称已存在");
		}else{
			item.setErrorNo("0");
			item.setErrorInfo("验证通过");
		}
		return item;			
	}
}
