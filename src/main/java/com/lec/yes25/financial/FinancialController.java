package com.lec.yes25.financial;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.common.C;

@Controller
@RequestMapping("/financial")
public class FinancialController {
	
	private Command command;
	
	// MyBatis
	private SqlSession sqlSession;

	public FinancialController() {
		super();
		System.out.println("FinancialController() 생성");
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	// 경로 설정
	@RequestMapping("/financialMain.bn")
	public String list(Model model) {
		command = new FListCommand();
		command.execute(model);
		return "financial/financialMain";
	}
	
	
}