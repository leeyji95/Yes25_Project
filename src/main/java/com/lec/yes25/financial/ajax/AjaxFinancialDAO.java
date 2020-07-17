package com.lec.yes25.financial.ajax;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lec.yes25.financial.FinancialDTO;

public interface AjaxFinancialDAO {
	// 페이징용 SELECT
	// from : 몇 번째 row 부터
	// pageRows : 몇 번째 데이터(게시글)
	public List<FinancialDTO> selectFromRow(
			@Param("from") int from,
			@Param("pageRows") int pageRows
			);

}
