package com.example.abc_job_portal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.abc_job_portal.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
    @Query("SELECT u FROM User u where u.email = :email")
    public User findUserByEmail(String email);

}