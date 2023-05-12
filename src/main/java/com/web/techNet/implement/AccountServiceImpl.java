
package com.web.techNet.implement;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import com.web.techNet.repository.AccountRepo;
import com.web.techNet.entity.Account;
import com.web.techNet.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountRepo accountRepo;

    @Autowired
    AccountService accountService;
    @Override
    public Page<Account> findByFullnameContaining(String fullname, Pageable pageable) {
        return accountRepo.findByFullnameContaining(fullname, pageable);
    }
    @Override
    public Optional<Account> findById(String id) {
        return accountRepo.findById(id);
    }

    @Override
    public <S extends Account> S save(S entity) {
        return accountRepo.save(entity);
    }
    @Override
    public <S extends Account> Optional<S> findOne(Example<S> example) {
        return accountRepo.findOne(example);
    }

    @Override
    public List<Account> findAll() {
        return accountRepo.findAll();
    }

    @Override
    public Page<Account> findAll(Pageable pageable) {
        return accountRepo.findAll(pageable);
    }

    @Override
    public List<Account> findAll(Sort sort) {
        return accountRepo.findAll(sort);
    }

    @Override
    public void flush() {
        accountRepo.flush();
    }

    @Override
    public <S extends Account> Page<S> findAll(Example<S> example, Pageable pageable) {
        return accountRepo.findAll(example, pageable);
    }

    @Override
    public <S extends Account> long count(Example<S> example) {
        return accountRepo.count(example);
    }

    @Override
    public long count() {
        return accountRepo.count();
    }

    @Override
    public void deleteById(String id) {
        accountRepo.deleteById(id);
    }

    @Override
    public Account getOne(String id) {
        return accountRepo.getOne(id);
    }

    @Override
    public void delete(Account entity) {
        accountRepo.delete(entity);
    }

    @Override
    public void deleteAll(Iterable<? extends Account> entities) {
        accountRepo.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        accountRepo.deleteAll();
    }

    @Override
    public <S extends Account> List<S> findAll(Example<S> example) {
        return accountRepo.findAll(example);
    }

    @Override
    public <S extends Account> List<S> findAll(Example<S> example, Sort sort) {
        return accountRepo.findAll(example, sort);
    }

    // reset password
    public void updateResetPasswordToken(String token, String email) {
        Account account = accountRepo.findByEmail(email);

        if (account != null) {
            account.setReset_password(token);
            accountRepo.save(account);
        }
    }

    public Account get(String resetPasswordToken) {
        return accountRepo.findByResetPasswordToken(resetPasswordToken);
    }

    public void updatePassword(Account account, String newPassword) {
        // BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        // String encodepassword = passwordEncoder.encode(newPassword);

        account.setPassword(newPassword);
        account.setReset_password(null);

        accountRepo.save(account);
    }

    @Override
    public Account findByUsername(String username) {
        return accountRepo.findByUsername(username);
    }

    @Override
    public long countByFullnameContaining(String fullname) {
        return accountRepo.countByFullnameContaining(fullname);
    }

}
