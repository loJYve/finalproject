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
				//아이디 기억하기 실패
//				   .rememberMe()
//				   .rememberMeParameter("rememeber-me")
//				   .tokenValiditySeconds(3600)
//				   .alwaysRemember(true)
//				   .userDetailsService(provider)
//				   .and()
				   .formLogin()
				   //로그인 페이지
				   .loginPage("/member/memberPage.do") 
			       .usernameParameter("MemberId")
				   .passwordParameter("password")
				   //로그인 실패시 
				   .failureUrl("/member/error.do")
				   //성공하면 기본적으로 가는페이지
				   .defaultSuccessUrl("/index")
				   .and()
				   .authorizeRequests()
				   .antMatchers("/index").permitAll()
				   .and()
				   //로그아웃
				   .logout()
				   .logoutUrl("/member/logout")
				   //로그아웃 성공 시 세션을 제거합니다.
				   .invalidateHttpSession(true)
				   .and()
				   .authenticationProvider(authenticationProvider())
				   .build();
				   
		}		   
}
