package com.bjscar.member.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.bjscar.member.model.vo.Member;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

public interface MemberService {
  
	int insertMember(Member m);
	
	Member selectMember(Member m);
	
	String PhoneNumberCheck(String to) throws CoolsmsException;
		
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;
	
	Member findId(Member m);
	
	Member findPw(Map param);
	
}
