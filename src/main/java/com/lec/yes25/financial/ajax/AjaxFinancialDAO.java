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
	
	// 전체 글의 개수
	public int countAll();
	
	// insert
	public int insert(
			@Param("regDate") String regDate,
			@Param("account_uid") int account_uid,
			@Param("summary") String summary,
			@Param("money") int money,
			@Param("writer") int writer,
			@Param("manager") int manager,
			@Param("approver") int approver
			);
	
	
	
}