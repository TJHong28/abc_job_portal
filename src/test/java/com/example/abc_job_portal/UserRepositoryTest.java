package com.example.abc_job_portal;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.example.abc_job_portal.entity.User;
import com.example.abc_job_portal.repository.UserRepository;

import net.bytebuddy.utility.RandomString;

@DisplayName("Unit Tests of UserRepository Class")
@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class UserRepositoryTest {
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private TestEntityManager entityManager;
	
	@Test //Create new user
	public void testCreateNewUser() {
		User user = new User(); //This will create a new user
		user.setUsername("junit-test"); //Insert data in column Username to junit-test
		user.setEmail("junit@example.com"); //Insert data in column Email to junit@example.com
		user.setPassword("password"); //Insert data in column Password to password
		user.setFirstname("ExampleFirst"); //Insert data in column Firstname to ExampleFirst
		user.setLastname("ExampeLast"); //Insert data in column Lastname to ExampleLast
		user.setCompany("ExampleCompany"); //Insert data in column Company to 
		user.setCity("ExampleCity"); //Insert data in column City to ExampleCity
		user.setCountry("ExampleCountry"); //Insert data in column Country to ExampleCountry
		user.setEnabled(true); //Account will be verified

		User savedUser = entityManager.persistAndFlush(user); 
		
		assertThat(savedUser.getEmail()).isEqualTo(user.getEmail());
	}
	
	@Test
	public void testNumberRegisteredUsers() {
		long count = userRepo.count(); //count the registered users
		System.err.println("size: " + count); //To print out number of registered user (size: RegisteredUsers)
		assertThat(count).isEqualTo(userRepo.findAll().size());
	}
	
	@Test
	public void testSearchByKeyword() {
		String keyword = "penang";
		List<User> results = userRepo.search(keyword);
		
		assertThat(results.size()).isEqualTo(userRepo.search(keyword).size());
	}  //WIP
	
	@Test
	public void testFindUserByEmail() {
		String email = "junit@example.com"; //Email to find
		User user = userRepo.findUserByEmail(email);
		
		assertThat(user.getEmail()).isEqualTo(email);
	}
	
	@Test
	public void testFindUserByUsername() {
		String username = "junit-test"; //username to find
		User user = userRepo.findUserByUsername(username);
		
		assertThat(user.getUsername()).isEqualTo(username);
	}
	
	@Test
	public void testFindUserByVerificationCode() {
		String verficationCode = RandomString.make(64);
		
		User user = userRepo.findUserByUsername("junit-test");
		user.setVerificationCode(verficationCode);
		
		User existedUser = userRepo.findByVerificationCode(verficationCode);
		
		assertThat(existedUser.getVerificationCode()).isEqualTo(verficationCode);
	} //WIP
	
	@Test
	public void testFindUserByResetPasswordToken() {
		String resetPasswordToken = RandomString.make(30);
		
		User user = userRepo.findUserByUsername("junit-test");
		user.setResetPasswordToken(resetPasswordToken);
		
		User existedUser = userRepo.save(user);
		User savedUser = userRepo.findUserByResetPasswordToken(resetPasswordToken);
		
		assertThat(existedUser.getResetPasswordToken()).isEqualTo(savedUser.getResetPasswordToken());
	} //NO IDEA
	
	@Test
	public void testDeleteUserById() {
		User user = userRepo.findUserByUsername("junit-test");		
		userRepo.deleteById(user.getId()); // delete the user by id
		
		User deletedUser = userRepo.findUserByUsername("junit-test"); // test retrieve it back
		
		assertThat(deletedUser).isEqualTo(null);
	} 
}
