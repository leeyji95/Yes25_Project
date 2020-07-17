package com.lec.yes25.financial;

import org.springframework.ui.Model;

import com.lec.common.C;

public class FListCommand implements Command{

	@Override
	public void execute(Model model) {
		FinancialDAO dao = C.sqlSession.getMapper(FinancialDAO.class);
		model.addAttribute("list", dao.select());
	} // end execute()

} // end class