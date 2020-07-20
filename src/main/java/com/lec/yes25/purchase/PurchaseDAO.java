package com.lec.yes25.purchase;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface PurchaseDAO {
	public int insert(@Param("dto") PublisherDTO pub_dto); // 삽입
	public List<PublisherDTO> selectByUid(int pub_uid); // 읽기
	public int update(@Param("dto") PublisherDTO pub_dto); // 수정
	public int deleteByUid(int[] pub_uids); // 삭제
	
	public int countAll(@Param("searchType") String searchType, @Param("keyword") String keyword);
	public List<PublisherDTO> selectFromRow(@Param("fromRow") int fromRow, @Param("pageRows") int pageRows, @Param("searchType") String searchType, @Param("keyword") String keyword);
}
