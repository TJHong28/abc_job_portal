package com.example.abc_job_portal.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.abc_job_portal.entity.User;
import com.example.abc_job_portal.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepostory;

    public void saveUser(User user) {
        userRepostory.save(user);
    }

}
