package com.handel.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.handel.models.Role;
import com.handel.models.User;

/**
 * Created by djlima on 5/23/17.
 */
@Repository
public class UserDAO implements UserDetailsService{

	@PersistenceContext
	private EntityManager manager;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	/**
	 * Returns user by username
	 *
	 * @param username user username
	 * @return user
	 */
	public User loadUserByUsername(String username) {
		List<User> users = manager
				.createQuery("select u from User u where u.username = :username", User.class)
			.setParameter("username", username)
			.getResultList();
		
		if (users.isEmpty()) {
			throw new UsernameNotFoundException("User " + username + " was not found");
		}
		
		return users.get(0);
	}
	
	@Transactional
	public void registerNewUserAccount(User accountDto) {
	    User user = new User();
	    user.setName(accountDto.getName());
	    user.setLastName(accountDto.getLastName());
	     
	    user.setPass(passwordEncoder.encode(accountDto.getPass()));
	     
	    user.setUsername(accountDto.getUsername());
	    List<Role> roles = Lists.newArrayList();
	    roles.add(new Role("ROLE_USER", user));
	    user.setRoles(roles);
	    manager.persist(user);
	}


}
