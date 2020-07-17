package com.lec.yes25.financial;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface FinancialDAO {
	public List<FinancialDTO> select();
}
