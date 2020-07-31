package com.lec.yes25.product.service;

import java.io.File;

import com.lec.common.C;
import com.lec.yes25.product.dto.AttachDTO;
import com.lec.yes25.product.mapper.AttachDAO;

public class FileDeleteService {
	
	public void Execute(int bookUid) {

		AttachDAO aDao = C.sqlSession.getMapper(AttachDAO.class);
		AttachDTO aDTO = aDao.selectByBookUid(bookUid);

		if (aDTO != null) {
			String filePath = aDTO.getUri() + aDTO.getSerName();
			System.out.println(filePath);
			File file = new File(filePath);

			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일 삭제 성공!");
				}
			}

		}

		aDao.deleteByBookUid(bookUid);
	}

}
