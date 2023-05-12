package com.web.techNet.HomeController;

import com.web.techNet.entity.Account;
import com.web.techNet.model.AccountDto;
import com.web.techNet.service.AccountService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {

	@Autowired
    AccountService accountService;

	@RequestMapping("/security/register")
	public String add(Model model) {
		AccountDto dto = new AccountDto();
		dto.setIsEdit(false);
		model.addAttribute("account", dto);
		return "security/register-css";
	}

	@PostMapping("/register/save")
	public ModelAndView saveOrUpdate(ModelMap model,
			@ModelAttribute("account") AccountDto dto) {

		if (!dto.getPassword().equals(dto.getPasswordRe())) {
			model.addAttribute("message", "Mật khẩu không trùng khớp");
			return new ModelAndView("security/register-css");
		}

		Account entity = new Account();
		BeanUtils.copyProperties(dto, entity);

		if (accountService.findById(entity.getUsername()).isPresent()) {
			model.addAttribute("message", "Tài khoản đã tồn tại");
			return new ModelAndView("security/register-css");
		}

		if (entity.getTelePhone().length() != 10) {
			model.addAttribute("message", "Số điện thoại phải đủ 10 số!");
			return new ModelAndView("security/register-css");
		}

		entity.setImage("noimage.jpg");

		accountService.save(entity);
		model.addAttribute("message", "Tạo tài khoản thành công!");
		return new ModelAndView("forward:/security/register", model);
	}

}
