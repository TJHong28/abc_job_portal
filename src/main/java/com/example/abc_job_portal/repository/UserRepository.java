package com.example.abc_job_portal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.abc_job_portal.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	
    @Query("SELECT u FROM User u where u.email = :email")
    public User findUserByEmail(String email);

	public User getUserByEmail(String username);
	
	@Query("SELECT u FROM User u WHERE u.verificationCode = ?1")
    public User findByVerificationCode(String code);

	@Query("SELECT u FROM User u WHERE u.username = :username")
	public User findUserByUsername(String username);
	
	@Query("SELECT u FROM User u WHERE u.resetPasswordToken = ?1")
	public User findUserByResetPasswordToken(String token);
	
	@Query(value = "SELECT s FROM User s WHERE s.username LIKE '%' || :keyword || '%'"
			+ " OR s.username LIKE '%' || :keyword || '%'"
			+ " OR s.firstname LIKE '%' || :keyword || '%'"
			+ " OR s.lastname LIKE '%' || :keyword || '%'"
			+ " OR s.company LIKE '%' || :keyword || '%'"
			+ " OR s.city LIKE '%' || :keyword || '%'"
			+ " OR s.country LIKE '%' || :keyword || '%'"
			)
	public List<User> search(@Param("keyword") String keyword);
}

