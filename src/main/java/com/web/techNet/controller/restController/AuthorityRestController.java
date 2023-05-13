
package com.web.techNet.controller.restController;

import com.web.techNet.entity.Authority;
import com.web.techNet.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController

@CrossOrigin("*")

@RequestMapping("/rest/authorities")
public class AuthorityRestController {

    @Autowired
    AuthorityService authorityService;

    @GetMapping
    public List<Authority> findAll(@RequestParam("admin") Optional<Boolean> admin) {
        if (admin.orElse(false)) {
            return authorityService.findAuthoritiesOfAdministrators();
        }
        return authorityService.findAll();
    }

    @PostMapping
    public Authority post(@RequestBody Authority auth) {
        return authorityService.create(auth);
    }

//    @DeleteMapping("{id}")
//    public void delete(@PathVariable("id") Integer id) {
//        authorityService.delete(id);
//
//    }

}
