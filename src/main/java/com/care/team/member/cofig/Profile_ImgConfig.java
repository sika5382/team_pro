package com.care.team.member.cofig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class Profile_ImgConfig {
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver mr = new CommonsMultipartResolver();
		mr.setMaxUploadSize(52428800);//50MB
		mr.setMaxInMemorySize(10485760);//10MB
		mr.setDefaultEncoding("UTF-8");
		return mr;
	}
}
