package com.example.abc_job_portal.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.abc_job_portal.entity.User;
import com.example.abc_job_portal.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	public void saveUser(User user) {
        userRepository.save(user);
    }

	public void registerNewUser(User user) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);

        userRepository.save(user);
    }


        // return all user's information, but hey, we may want to retrieve all except password right?! think about it!
    public List<User> retrieveAllUserProfile() {
        return userRepository.findAll();
    }
}