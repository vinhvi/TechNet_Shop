package com.web.techNet.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.web.techNet.entity.Feedback;

@Repository
public interface FeedbackRepo extends JpaRepository<Feedback, Long> {

	@Query(value = "SELECT f.* FROM Feedbacks f INNER JOIN Accounts a ON f.Username = a.Username WHERE a.username = ?1", countQuery = "SELECT COUNT(*) FROM Feedbacks f INNER JOIN Accounts a ON f.Username = a.Username WHERE a.username = ?1", nativeQuery = true)
	Page<Feedback> findByAccountUsername(String username, Pageable pageable);

	long countByAccountUsername(String username);

	// Page<Feedback> findByUsernameContaining(String username, Pageable pageable);
}
