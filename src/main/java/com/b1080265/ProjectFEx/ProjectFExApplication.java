package com.b1080265.ProjectFEx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "com.b1080265.ProjectFEx.entities")

@EnableJpaRepositories(basePackages = "com.b1080265.ProjectFEx")
public class ProjectFExApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectFExApplication.class, args);
	}

}
