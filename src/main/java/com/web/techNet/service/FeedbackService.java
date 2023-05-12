package com.web.techNet.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.web.techNet.entity.Feedback;

public interface FeedbackService {

	void delete(Feedback entity);

	Optional<Feedback> findById(Long id);

	List<Feedback> findAll();

	<S extends Feedback> S save(S entity);

	Page<Feedback> findAll(Pageable pageable);

	// Page<Feedback> findByUsernameContaining(Account account, Pageable pageable);
}
