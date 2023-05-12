package com.web.techNet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import com.web.techNet.storageConfig.StorageProperties;

@EnableConfigurationProperties(StorageProperties.class)
@SpringBootApplication
public class TechNetApplication {

	public static void main(String[] args) {
		SpringApplication.run(TechNetApplication.class, args);
	}

}
