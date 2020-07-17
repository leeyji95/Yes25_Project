package com.lec.yes25.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.lec.yes25.product.dto.BookDTO;

@MapperScan
public interface ProductDAO {
	public List<BookDTO> select();
	public int insert(final BookDTO dto);
	public int deleteByUid(final int uid);
	public int update(final int uid, @Param("a") final BookDTO dto);

}
