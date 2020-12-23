package com.care.team.member.cofig;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@MapperScan(basePackages = {"com.care.team.member.data"})
@PropertySource("classpath:application.properties")
public class JdbcConfig_member {
	@Value("${spring.datasource.driver-class-name}")
	String driverClassName;
	@Value("${spring.datasource.url}") String url;
	@Value("${spring.datasource.username}") String username;
	@Value("${spring.datasource.password}") String password;
	
	@Bean
	public DriverManagerDataSource dataSource() {
		System.out.println("driverClassName : "+driverClassName);
		System.out.println("url : "+url);
		System.out.println("username : "+username);
		System.out.println("password : "+password);
		DriverManagerDataSource ds = new DriverManagerDataSource();
		ds.setDriverClassName(driverClassName);
		ds.setUrl(url);
		ds.setUsername(username);
		ds.setPassword(password);
		return ds;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(dataSource());
		return ssf.getObject();
	}
	
	@Bean
	public SqlSession sqlSession() throws Exception{
		return new SqlSessionTemplate(sqlSessionFactory());
	}
}
