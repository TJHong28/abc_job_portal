package com.example.abc_job_portal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
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
			@PostMapping("/process_signup")
		    public String registerNewUser(@ModelAttribute("user") User user) {
		        userService.saveUser(user);

		        System.out.println(user.getUsername());
		        System.out.println(user.getEmail());
		        System.out.println(user.getPassword());

		        return "thank";
		    }

	}
}
