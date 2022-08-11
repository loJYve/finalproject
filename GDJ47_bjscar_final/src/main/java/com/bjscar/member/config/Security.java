package com.bjscar.member.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;



@Configuration
@EnableWebSecurity
public class Security{
	
	
	
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
//				   .rememberMe()
//				   .rememberMeParameter("rememeber-me")
//				   .tokenValiditySeconds(3600)
//				   .alwaysRemember(true)
//				   .userDetailsService(provider)
//				   .and()
				   .formLogin()
				   .loginPage("/member/memberPage.do") 
			       .usernameParameter("MemberId")
				   .passwordParameter("password")
				   .failureUrl("/member/error.do")
				   .defaultSuccessUrl("/index")
				   .and()
				   .authorizeRequests()
				   .antMatchers("/index").permitAll()
				   .and()
				   .logout()
				   .logoutUrl("/member/logout")
				   .invalidateHttpSession(true)
				   .and()
				   .authenticationProvider(authenticationProvider())
				   .build();
				   
		}		   
}
