package com.bjscar.member.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class Security {
   @Bean
   public AuthenticationProvider authenticationProvider() {
	   return new MyProvider();
   }
   @Bean
   public BCryptPasswordEncoder bCryptPasswordEncoder() {
	   return new BCryptPasswordEncoder();
   }
   
	@Bean
	public SecurityFilterChain authenticatePath(HttpSecurity http) throws Exception{
		return http.csrf().disable()
				   .formLogin()
				   .loginPage("/loginPage") 
				   .usernameParameter("MemberId")
				   .passwordParameter("password")
				   .failureForwardUrl("/error.do")
				   .successForwardUrl("/successLogin.do")
				   .and()
				   .authorizeRequests()
				   .antMatchers("/**").hasRole("USER")
				   .and()
				   .logout()
				    .logoutUrl("logout")
				    .and()
				    .authenticationProvider(authenticationProvider())
				    .build();
				   
				   
	}
}
