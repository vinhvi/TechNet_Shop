package com.web.techNet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.techNet.repository.RoleRepo;
import com.web.techNet.entity.Role;
import com.web.techNet.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	RoleRepo rdao;

	@Override
	public List<Role> findAll() {
		return rdao.findAll();
	}

}
