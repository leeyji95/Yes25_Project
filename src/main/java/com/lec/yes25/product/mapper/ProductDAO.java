package com.lec.yes25.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.lec.yes25.product.dto.BookDTO;

public interface ProductDAO {
	public List<BookDTO> select();
	public List<BookDTO> selectByUid(final int uid);
	public int insert(final BookDTO dto);
	public int deleteByUid(final int uid);
	public int update(final BookDTO dto);

}
