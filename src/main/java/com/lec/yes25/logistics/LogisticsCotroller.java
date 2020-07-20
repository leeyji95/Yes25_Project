package com.lec.yes25.logistics;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.common.C;

@Controller
@RequestMapping("/logistics")
public class LogisticsCotroller {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	@RequestMapping("/inventory")
	public String inventory(Model model) {
		return "logistics/inventory";
	}
	
	@RequestMapping("/inbound")
	public String inBound(Model model) {
		return "logistics/inbound";
	}
	
	
}
