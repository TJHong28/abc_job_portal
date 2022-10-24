package com.example.abc_job_portal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.abc_job_portal.entity.User;
import com.example.abc_job_portal.service.UserService;

@SpringBootApplication
public class AbcJobPortalApplication extends SpringBootServletInitializer {
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(AbcJobPortalApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(AbcJobPortalApplication.class, args);
	}
	
	@Controller
	public class CommonController {
		
		@Autowired
		private UserService userService;
		
			@GetMapping("/")
			public String getHomepage() {
				return "index";
			}
			@GetMapping("/login")
			public String getSignInPage() {
				return "login";
			}
			@GetMapping("/signup")
			public String getSignUpPage() {
				return "signup";
			}
			@GetMapping("/thank")
			public String getThankYouPage() {
				return "thank";
			}
			
			@GetMapping("/dashboard")
			public String getDashboardPage(Model model) {
				List<User> users = userService.retrieveAllUserProfile();
				model.addAttribute("users", users);
				
				return "dashboard";
			}
			
			@PostMapping("/process_signup")
			public String register(Model model, @ModelAttribute("user") User user) {
					
				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				String encodedPassword = passwordEncoder.encode(user.getPassword()) ;
				user.setPassword(encodedPassword);
				
				userService.saveUser(user);
					
				return "thank";
		}
	}
}
