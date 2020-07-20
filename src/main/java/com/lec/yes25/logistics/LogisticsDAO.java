package com.lec.yes25.logistics;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface LogisticsDAO {
	public int countAll();
	public List<LogisticsDTO> selectFromRow(int from, int rows);
	public int insertByUidFromOrder(int[] uids);
	public int updateByUidFromOrder(int[] uids);
	public int updateByUidFromStock(int[] uids);
	
}
