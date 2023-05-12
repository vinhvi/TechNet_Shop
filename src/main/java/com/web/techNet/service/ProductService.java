package com.web.techNet.service;

import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import com.web.techNet.entity.Product;

public interface ProductService {

    void deleteAll();

    Product getReferenceById(Long id);

    void deleteAll(Iterable<? extends Product> entities);

    void deleteAllById(Iterable<? extends Long> ids);

    Product getById(Long id);

    void delete(Product entity);

    Product getOne(Long id);

    void deleteById(Long id);

    void deleteAllInBatch();

    long count();

    void deleteAllByIdInBatch(Iterable<Long> ids);

    void deleteAllInBatch(Iterable<Product> entities);

    boolean existsById(Long id);

    void deleteInBatch(Iterable<Product> entities);

    Optional<Product> findById(Long id);

    <S extends Product> List<S> saveAllAndFlush(Iterable<S> entities);

    <S extends Product> S saveAndFlush(S entity);

    void flush();

    <S extends Product> List<S> saveAll(Iterable<S> entities);

    List<Product> findAllById(Iterable<Long> ids);

    List<Product> findAll(Sort sort);

    List<Product> findAll();

    <S extends Product> S save(S entity);

    List<Product> findByCategoryId(Long cid);

    List<Product> findByNameContaining(String name);

    Page<Product> findByNameContaining(String name, Pageable pageable);

    Page<Product> findAll(Pageable pageable);

    long countByNameContaining(String name);
}
