
package com.web.techNet.implement;

import com.web.techNet.entity.Account;
import com.web.techNet.repository.AccountRepo;
import com.web.techNet.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountRepo adao;

    @Autowired
    AccountService accountService;

    @Override
    public Page<Account> findByFullnameContaining(String fullname, Pageable pageable) {
        return adao.findByFullnameContaining(fullname, pageable);
    }

    @Override
    public Optional<Account> findById(String id) {
        return adao.findById(id);
    }

    @Override
    public <S extends Account> S save(S entity) {
//        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//        String encodepassword = passwordEncoder.encode(entity.getPassword());
//        entity.setPassword(encodepassword);
        return adao.save(entity);
    }

    @Override
    public <S extends Account> Optional<S> findOne(Example<S> example) {
        return adao.findOne(example);
    }

    @Override
    public List<Account> findAll() {
        return adao.findAll();
    }

    @Override
    public Page<Account> findAll(Pageable pageable) {
        return adao.findAll(pageable);
    }

    @Override
    public List<Account> findAll(Sort sort) {
        return adao.findAll(sort);
    }

    @Override
    public List<Account> findAllById(Iterable<String> ids) {
        return adao.findAllById(ids);
    }

    @Override
    public <S extends Account> List<S> saveAll(Iterable<S> entities) {
        return adao.saveAll(entities);
    }

    @Override
    public void flush() {
        adao.flush();
    }

    @Override
    public <S extends Account> S saveAndFlush(S entity) {
        return adao.saveAndFlush(entity);
    }

    @Override
    public <S extends Account> List<S> saveAllAndFlush(Iterable<S> entities) {
        return adao.saveAllAndFlush(entities);
    }

    @Override
    public <S extends Account> Page<S> findAll(Example<S> example, Pageable pageable) {
        return adao.findAll(example, pageable);
    }

    @Override
    public void deleteInBatch(Iterable<Account> entities) {
        adao.deleteInBatch(entities);
    }

    @Override
    public boolean existsById(String id) {
        return adao.existsById(id);
    }

    @Override
    public <S extends Account> long count(Example<S> example) {
        return adao.count(example);
    }

    @Override
    public void deleteAllInBatch(Iterable<Account> entities) {
        adao.deleteAllInBatch(entities);
    }

    @Override
    public <S extends Account> boolean exists(Example<S> example) {
        return adao.exists(example);
    }

    @Override
    public void deleteAllByIdInBatch(Iterable<String> ids) {
        adao.deleteAllByIdInBatch(ids);
    }

    @Override
    public <S extends Account, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return adao.findBy(example, queryFunction);
    }

    @Override
    public long count() {
        return adao.count();
    }

    @Override
    public void deleteAllInBatch() {
        adao.deleteAllInBatch();
    }

    @Override
    public void deleteById(String id) {
        adao.deleteById(id);
    }

    @Override
    public Account getOne(String id) {
        return adao.getOne(id);
    }

    @Override
    public void delete(Account entity) {
        adao.delete(entity);
    }

    @Override
    public Account getById(String id) {
        return adao.getById(id);
    }

    @Override
    public void deleteAllById(Iterable<? extends String> ids) {
        adao.deleteAllById(ids);
    }

    @Override
    public void deleteAll(Iterable<? extends Account> entities) {
        adao.deleteAll(entities);
    }

    @Override
    public Account getReferenceById(String id) {
        return adao.getReferenceById(id);
    }

    @Override
    public void deleteAll() {
        adao.deleteAll();
    }

    @Override
    public <S extends Account> List<S> findAll(Example<S> example) {
        return adao.findAll(example);
    }

    @Override
    public <S extends Account> List<S> findAll(Example<S> example, Sort sort) {
        return adao.findAll(example, sort);
    }

    @Override
    public List<Account> findByUsernameContaining(String username) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Account> getAdministrators() {
        return adao.getAdministratiors();
    }

    // reset password
    public void updateResetPasswordToken(String token, String email) {
        Account account = adao.findByEmail(email);

        if (account != null) {
            account.setReset_password(token);
            adao.save(account);
        }
    }

    public Account get(String resetPasswordToken) {
        return adao.findByResetPasswordToken(resetPasswordToken);
    }

    public void updatePassword(Account account, String newPassword) {
         BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
         String encodepassword = passwordEncoder.encode(newPassword);

        account.setPassword(encodepassword);
        account.setReset_password(encodepassword);

        adao.save(account);
    }

    @Override
    public Account findByUsername(String username) {
        return adao.findByUsername(username);
    }

    @Override
    public long countByFullnameContaining(String fullname) {
        return adao.countByFullnameContaining(fullname);
    }

}
