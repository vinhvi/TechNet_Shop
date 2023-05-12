package com.web.techNet.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountDto implements Serializable {
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String reset_password;
	private String passwordRe;
	private String fullname;
	private String email;
	private String image;
	private MultipartFile imageFile;
	private String address;
	private String telePhone;
	private Boolean isEdit;
}
