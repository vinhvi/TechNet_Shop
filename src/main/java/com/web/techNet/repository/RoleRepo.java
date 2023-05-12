package com.web.techNet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.web.techNet.entity.Role;

public interface RoleRepo extends JpaRepository<Role, String> {
	
}
