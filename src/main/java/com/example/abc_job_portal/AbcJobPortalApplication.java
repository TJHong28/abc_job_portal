package com.example.abc_job_portal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			public String getDashboardPage(Model model, @CurrentSecurityContext(expression = "authentication?.name") String username) {
				List<User> users = userService.retrieveAllUserProfile();
				model.addAttribute("users", users);
				
				//retrieve loggedinuser id
				User loggedInUser = userService.getUserByUsername(username);
				model.addAttribute("person", loggedInUser);
				
				
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
			//get profile page
			@GetMapping("/profile")
			public String getProfilePage(Model model, @RequestParam("id") Integer user_id) {
				User user = userService.getUserById(user_id);
				model.addAttribute("user", user);
				return "profile";
			}
			
			@PostMapping("/update-profile")
		    public String updateUserProfile(Model model, @ModelAttribute("user") User tmp, @RequestParam("id") Integer user_id) {
		        User user = userService.getUserById(user_id);

		        user.setFirstname(tmp.getFirstname());
		        user.setLastname(tmp.getLastname());
		        user.setCompany(tmp.getCompany());
		        user.setCity(tmp.getCity());
		        user.setCountry(tmp.getCountry());

		        userService.saveUser(user);

		        return "redirect:dashboard";
			}
			
			@PostMapping("/dashboard")
			public void search(Model model, HttpServletRequest request) {
				String keyword = request.getParameter("keyword");
				List<User> users = userService.search(keyword);
				Integer count = users.size();
				
				model.addAttribute("count", count);
				model.addAttribute("users", users);
			}
	}
}