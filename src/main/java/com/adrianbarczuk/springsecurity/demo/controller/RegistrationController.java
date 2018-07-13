package com.adrianbarczuk.springsecurity.demo.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.adrianbarczuk.springsecurity.demo.user.UserCrm;

@Controller
@RequestMapping("/register")
public class RegistrationController {
	
	@Autowired
	private UserDetailsManager userDetailsManager;
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	
	}
	
	@GetMapping("/registrationForm")
	public String showMyLoginPage(Model model) {
		
		model.addAttribute("crmUser", new UserCrm());
		return "registration-form";
		
	}
	
	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(@Valid @ModelAttribute("crmUser") UserCrm user,
							BindingResult bindingResult,
							Model model) {
		
		// form validation
		if (bindingResult.hasErrors()) {
			
			model.addAttribute("crmUser", new UserCrm());
			model.addAttribute("registrationError", "User name/password can not be empty.");
			
			return "registration-form";
			
		}
		
		// check the database if user already exists
		String userName = user.getUserName();
		
		if (doesUserExist(userName)) {
			
			model.addAttribute("crmUser", new UserCrm());
			model.addAttribute("registrationError", "Name already exists.");
			
			return "registration-form";
		}
		
		// encrypt the password
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		
		// prepend the encoding algorithm id
		encodedPassword = "{bcrypt}" + encodedPassword;
		
		// give user default role of "employee"
		List<GrantedAuthority> authorities =
				AuthorityUtils.createAuthorityList("ROLE_EMPLOYEE");
		
		// create user details object
		User tempUser = new User(userName, encodedPassword, authorities);
		
		// save user in the database
		userDetailsManager.createUser(tempUser);
		
	return "registration-confirmation";
	
	}
	
	private boolean doesUserExist(String userName) {
		
		// check the database if the user already exists
		boolean exists = userDetailsManager.userExists(userName);
		
		return exists;
	}

}
