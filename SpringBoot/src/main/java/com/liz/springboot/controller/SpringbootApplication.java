package com.liz.springboot.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;

@SpringBootApplication
public class SpringbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootApplication.class, args);
	}

	@Bean
	public EmbeddedServletContainerCustomizer containerCustomizer() {
//		这是使用Java 8的lambda表达式来简化实现的方式，在代码中创建了三个ErrorPage实例来处理三个通用的HTTP错误状态码，并将他们添加到Container当中。
// ErrorPage类是一个封装了错误信息的类，它可以在Jetty和Tomcat环境下使用。
		return (container -> {
			ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/errorpage/401.html");
			ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/errorpage/404.html");
			ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/errorpage/500.html");
			container.addErrorPages(error401Page, error404Page, error500Page);
		});
	}
}
