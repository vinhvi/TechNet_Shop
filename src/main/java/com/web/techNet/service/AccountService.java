package com.web.techNet.service;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;

import com.web.techNet.entity.Account;

public interface AccountService {

    <S extends Account> List<S> findAll(Example<S> example);

    void deleteAll();

    Account findByUsername(String username);

    void deleteAll(Iterable<? extends Account> entities);

    void delete(Account entity);

    Account getOne(String id);

    void deleteById(String id);

    long count();
    
    <S extends Account> long count(Example<S> example);

    Optional<Account> findById(String id);

    <S extends Account> Page<S> findAll(Example<S> example, Pageable pageable);

    void flush();

    List<Account> findAll(Sort sort);

    Page<Account> findAll(Pageable pageable);

    List<Account> findAll();

    <S extends Account> Optional<S> findOne(Example<S> example);

    <S extends Account> S save(S entity);

    public void updateResetPasswordToken(String token, String email);

    public void updatePassword(Account account, String newPassword);

    public Account get(String resetPasswordToken);

    Page<Account> findByFullnameContaining(String fullname, Pageable pageable);

    long countByFullnameContaining(String fullname);

}
