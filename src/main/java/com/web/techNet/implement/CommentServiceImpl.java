package com.web.techNet.implement;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.web.techNet.repository.CommentRepo;
import com.web.techNet.entity.Comment;
import com.web.techNet.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentRepo cdao;

	@Override
	public Page<Comment> findAll(Pageable pageable) {
		return cdao.findAll(pageable);
	}

	@Override
	public <S extends Comment> S save(S entity) {
		return cdao.save(entity);
	}

	@Override
	public Optional<Comment> findById(Long id) {
		return cdao.findById(id);
	}

	@Override
	public void delete(Comment entity) {
		cdao.delete(entity);
	}

	@Override
	public List<Comment> findAll() {
		return cdao.findAll();
	}

	@Override
	public Page<Comment> findByUsernameContaining(String username, Pageable pageable) {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Unimplemented method 'findByUsernameContaining'");
	}

	// @Override
	// public Page<Comment> findByUsernameContaining(String username, Pageable
	// pageable) {
	// return cdao.findByUsernameContaining(username, pageable);
	// }

}
