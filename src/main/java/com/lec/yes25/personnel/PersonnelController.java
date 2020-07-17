package com.lec.yes25.personnel;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.common.C;

@Controller
@RequestMapping("/personnel")
public class PersonnelController {

	// 컨트롤러는 서버가 가동될 때 생성되며, 스프링 컨테이너에 생성이 된다 .
	// MyBabatis
	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}

	public PersonnelController() {
		super();
		System.out.println("PersonnelController() 생성");
	}

	// REST 게시판
	@RequestMapping(value = "/list")
	public String rest() {
		System.out.println("personnel/list 경로로...");
		return "personnel/list";
	}

}
