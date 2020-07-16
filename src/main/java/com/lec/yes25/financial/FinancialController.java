package com.lec.yes25.financial;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.common.C;
import com.lec.common.Command;

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
	@RequestMapping("/write.bn")
	public String write() {
		return "financial/write";
	}
	
	@RequestMapping("/writeOk.bn")
	public String writeOk() {
		return "financial/writeOk";
	}
	
}
