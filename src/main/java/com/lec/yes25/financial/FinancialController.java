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
	
	@RequestMapping("/write.bn")
	public String write(Model model) {
		return "financial/write";
	}
	
//	@RequestMapping(value = "/writeOk.bn", method = RequestMethod.POST)
//	public String writeOk(FinancialDTO dto, Model model) {
//		model.addAttribute("dto", dto);
//		System.out.println("writeOk.bn()>>>"+model.toString());
//		new FWriteCommand().execute(model);
//		return "financial/writeOk";
//	}
	
	@RequestMapping(value = "/writeOk.bn", method = RequestMethod.POST)
	public String writeOk(FinancialDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new FWriteCommand().execute(model);
		return "financial/writeOk";
	}
	
	
	
}