package com.bjscar.member.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.bjscar.member.model.service.MemberService;
import com.bjscar.member.model.vo.Member;

public class MyProvider implements AuthenticationProvider{
    @Autowired
    private MemberService service;
    @Autowired
    private BCryptPasswordEncoder encoder;
    
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		//DB 데이터에서 인증하는 내용을 구성
		String username = authentication.getName();
		String password = (String)authentication.getCredentials();
		Member loginMember =(Member)service.loadUserByUsername(username);
		
		if(loginMember==null||encoder.matches(password,loginMember.getPassword()))
			throw new BadCredentialsException("인증실패");
		
		
		return new UsernamePasswordAuthenticationToken(loginMember,
				loginMember.getPassword(),loginMember.getAuthorities());
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
}
