package com.cos.shumstart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com"})
public class ShumStartApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShumStartApplication.class, args);
	}

}
