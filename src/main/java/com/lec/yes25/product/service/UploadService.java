package com.lec.yes25.product.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.lec.common.C;
import com.lec.yes25.product.dto.AttachDTO;
import com.lec.yes25.product.mapper.AttachDAO;

public class UploadService {
	
	public void execute(MultipartFile file, HttpSession session, int bookUid) {
		String originalFileName = file.getOriginalFilename();
		String storageName = UUID.randomUUID().toString() + "_" + originalFileName;
		int fileSize = (int) file.getSize();
		String fileType = file.getContentType();
		String filePath = session.getServletContext().getRealPath("upload/book") + File.separator;

		System.out.println("원본이름: " + originalFileName);
		System.out.println("저장이름: " + storageName);
		System.out.println("파일 크기: " + fileSize);
		System.out.println("파일 타입: " + fileType);
		System.out.println("저장경로: " + filePath);

		// 데이터 베이스에 정보를 저장하는 건
		// 이렇게 file의 get 메소드를 활용해 필요한 정보들을 가져오고
		// 그걸 DTO에 담아 insert하면 된다.
		// 간단한거니 후의 과정은 생략하고 파일로 서버에 저장하는 걸 보자면
		try (FileOutputStream fos = new FileOutputStream(filePath + storageName);
				// 파일 저장할 경로 + 파일명을 파라미터로 넣고 fileOutputStream 객체 생성하고
				InputStream is = file.getInputStream();) {
			// file로 부터 inputStream을 가져온다.

			int readCount = 0;
			byte[] buffer = new byte[1024];
			// 파일을 읽을 크기 만큼의 buffer를 생성하고
			// ( 보통 1024, 2048, 4096, 8192 와 같이 배수 형식으로 버퍼의 크기를 잡는 것이 일반적이다.)

			while ((readCount = is.read(buffer)) != -1) {
				// 파일에서 가져온 fileInputStream을 설정한 크기 (1024byte) 만큼 읽고

				fos.write(buffer, 0, readCount);
				// 위에서 생성한 fileOutputStream 객체에 출력하기를 반복한다
			}
		} catch (Exception ex) {
			throw new RuntimeException("file Save Error");
		}

		AttachDTO dto = new AttachDTO(originalFileName, storageName, fileType, filePath, fileSize, bookUid);
		AttachDAO dao = C.sqlSession.getMapper(AttachDAO.class);
		dao.insert(dto);
	}

}
