package com.web.techNet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.web.techNet.entity.Comment;

@Repository
public interface CommentRepo extends JpaRepository<Comment, Long> {

	// Page<Comment> findByUsernameContaining(String username, Pageable pageable);

}
