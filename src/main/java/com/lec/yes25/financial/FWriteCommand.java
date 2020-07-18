package com.lec.yes25.financial;

import java.util.Map;

import org.springframework.ui.Model;

import com.lec.common.C;

public class FWriteCommand implements Command {

	@Override
	public void execute(Model model) {
		System.out.println("들어오니?1");
		// Model 안에 있는 값(attribute) 꺼내기
		Map<String, Object> map = model.asMap();
		FinancialDTO dto = (FinancialDTO)map.get("dto");
		
		// MyBatis 사용
		FinancialDAO dao = C.sqlSession.getMapper(FinancialDAO.class);
		model.addAttribute("result", dao.insert(dto));
		
		System.out.println("들어오니?2");
System.out.println(dto.toString());

		
		/* 주노 코드*/
		//FinancialDTO dto = (FinancialDTO)map.get("dto");
		//System.out.println("FWriteCommand>>>> dto"+dto.toStringDefault());
		// MyBatis 사용
		//FinancialDAO dao = C.sqlSession.getMapper(FinancialDAO.class);
		//model.addAttribute("result", dao.insert(dto));

	} // end execute()

} // end Command