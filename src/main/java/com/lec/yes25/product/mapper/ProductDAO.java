package com.lec.yes25.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.lec.yes25.product.dto.BookDTO;

public interface ProductDAO {
	public List<BookDTO> select(int page, int pageRows);
	public List<BookDTO> selectBySearch(int page, int pageRows, String keyword);
	public List<BookDTO> selectByUid(final int uid);
	public int selectCount();
	public int selectSearchCount(String keyword);
	public int insert(final BookDTO dto);
	public int deleteByUid(final int uid);
	public int update(final BookDTO dto);

}
