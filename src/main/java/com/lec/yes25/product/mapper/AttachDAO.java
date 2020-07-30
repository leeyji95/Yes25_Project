package com.lec.yes25.product.mapper;

import com.lec.yes25.product.dto.AttachDTO;

public interface AttachDAO {
	public int insert(final AttachDTO dto);
	public AttachDTO selectByBookUid(final int bookUid);
	public int deleteByBookUid(final int bookUid);

}
