package com.bjscar.member.model.service;


import java.util.HashMap;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bjscar.member.model.dao.MemberDao;
import com.bjscar.member.model.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
@Service

public class MemberServiceImpl implements MemberService,UserDetailsService{
    @Autowired
    private MemberDao dao;
    
    @Autowired
    SqlSession session;
	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(session,m);
	}
	
	@Override
	public Member selectMember(Member m) {
		// TODO Auto-generated method stub
		return dao.selectMember(session,m);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Member m=dao.findByMemberId(username,session);
		if(m==null) throw new UsernameNotFoundException(username+"을 찾을 수 없습니다.");
		
		
		return m;
	}
	
	
	@Override
	public String PhoneNumberCheck(String to) throws CoolsmsException {
	
		String api_key = "NCSFDY2KP4NFILPY";
		String api_secret = "HOEBEL8DVQOB3PG9HBSEEZ4L2C60CVSP";
		Message coolsms = new Message(api_key, api_secret);
		
		Random rand  = new Random();
    String numStr = "";
    for(int i=0; i<4; i++) {
       String ran = Integer.toString(rand.nextInt(10));
       numStr+=ran;
    }          

    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", "01096761721");    // 수신전화번호 (ajax로 view 화면에서 받아온 값으로 넘김)
    params.put("from", "01096761721");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
    params.put("type", "sms"); 
    params.put("text", "bjscar 인증번호는 [" + numStr + "] 입니다.");

    coolsms.send(params); // 메시지 전송
        
    return numStr;

	}

}
