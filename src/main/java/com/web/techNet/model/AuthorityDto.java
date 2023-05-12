package com.web.techNet.model;

import java.io.Serializable;

import com.web.techNet.entity.Account;
import com.web.techNet.entity.Role;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthorityDto implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Account account;
	private Role role;
	private Boolean isEdit;
}