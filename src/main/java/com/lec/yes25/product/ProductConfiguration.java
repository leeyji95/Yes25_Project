package com.lec.yes25.product;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;

@Configuration
public class ProductConfiguration {
	
	private final int FILE_MAX_UPLOAD_SIZE = 10485760; // 1024 * 1024 * 10
    // 이 사이즌는 당연히 필요에 따라 변경하면 된다
 
    @Bean
    public MultipartResolver multipartResolver() {
        org.springframework.web.multipart.commons.CommonsMultipartResolver multipartResolver = new org.springframework.web.multipart.commons.CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(FILE_MAX_UPLOAD_SIZE); 
        return multipartResolver;
    }


}
