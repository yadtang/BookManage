package edu.fjnu.book.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.fjnu.book.dao.EvaluateDao;
import edu.fjnu.book.domain.Evaluate;
import edu.fjnu.book.service.EvaluateService;
@Service
public class EvaluateServiceImpl implements EvaluateService{
	@Autowired
	EvaluateDao evaluateDao;
	
	public Evaluate get(Serializable id) {
		// TODO Auto-generated method stub
		return evaluateDao.get(id);
	}

	public void insert(Evaluate evaluate) {
		// TODO Auto-generated method stub
		evaluateDao.insert(evaluate);
	}

	public void update(Evaluate evaluate) {
		// TODO Auto-generated method stub
		evaluateDao.update(evaluate);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		evaluateDao.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		evaluateDao.delete(ids);
	}


	public PageInfo<Evaluate> findByPage(Evaluate evaluate, Integer pageNo,
			Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Evaluate> list = evaluateDao.find(evaluate);
	    //用PageInfo对结果进行包装
	    PageInfo<Evaluate> page = new PageInfo<Evaluate>(list);
	    return page;
	}

	public List<Evaluate> find(Evaluate evaluate) {
		// TODO Auto-generated method stub
		return evaluateDao.find(evaluate);
	}

	public Map<String, Object> getScoreProp(Serializable bookid) {
		Evaluate evaluate = new Evaluate();
		evaluate.setBookid((String) bookid);
		List<Evaluate> evaluates = evaluateDao.find(evaluate);
		Map<String,Object> map = new HashMap<String,Object>();
		int num5 = 0;
		int num4 = 0;
		int num3 = 0;
		int num2 = 0;
		int num1 = 0;
		int total = evaluates.size();
		if(total == 0){//没有任何评价
			map.put("num5", num5);
			map.put("num4", num4);
			map.put("num3", num3);
			map.put("num2", num2);
			map.put("num1", num1);
			return map;
		}
		for(Evaluate eval : evaluates){
			if(eval.getScore() == 5){
				num5 ++;
			}else if(eval.getScore() == 4){
				num4 ++;
			}else if(eval.getScore() == 3){
				num3 ++;
			}else if(eval.getScore() == 2){
				num2 ++;
			}else if(eval.getScore() == 1){
				num1 ++;
			}
		}
		map.put("num5", num5);
		map.put("num4", num4);
		map.put("num3", num3);
		map.put("num2", num2);
		map.put("num1", num1);
		return map;
	}

}
