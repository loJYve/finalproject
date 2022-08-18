package com.bjscar.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class OAuthService{

	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
        	//URL class HTTP프로토콜 사용을 통해 서버와 통신하는 class
            URL url = new URL(reqURL);
            //URLConnection 인스턴스는 url 객체의 openConnection()메소드를 호출에 의하여 얻어진다.
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            
            conn.setRequestMethod("POST");
//          setDoOutput URLConnection이 서버에 데이터를 보내는데 사용할수있는지 여부를 설정한다(기본값 false -> ture로 변경)
            conn.setDoOutput(true);
            
            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송 IOException 사용, 
            //BufferedWriter: 버퍼를 이용한 출력
            //System.out.println()과 유사 속도가 빠르다.
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            //StringBuilder string을 더해주는 객체이며 append로 연결해준다
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=c092a856fb0ff2740a4131083dd48690");//api
            sb.append("&redirect_uri=http://localhost:9090/oauth2/code/kakao");//redirect 주소
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());//문자열로변경
            bw.flush();// write로 담은 내용 출력 후, 버퍼를 비움
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            //url 응답 getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기 
            //BufferedReader: 버퍼를 이용한 입력
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            //여기서부터다시설명보기
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonElement element = JsonParser.parseString(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            //입출력닫기
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return access_Token;
    }
    
	public HashMap<String, Object> getUserInfo (String access_Token) {
	    
	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
//	        JsonParser parser = new JsonParser();
//	        JsonElement element = parser.parse(result);	       
//	        JsonObject properties = null;
//	        	 if(element.getAsJsonObject().get("properties") == null) {
//	        	
//	        	 }else {
//	        		 properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//		        		JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//		 		        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//		 		        String email = kakao_account.getAsJsonObject().get("email").getAsString();
//		 		       userInfo.put("nickname", nickname);
//		 		        userInfo.put("email", email);
//	        	 }
	        if(result!=null) {
	        	 JsonElement element = JsonParser.parseString(result);
	        	 if(element.getAsJsonObject().get("properties")!=null){
	        		 JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	     	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	     	        
	     	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	     	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	     	        String profile = properties.getAsJsonObject().get("profile_image").getAsString();
	     	        
	     	        userInfo.put("nickname", nickname);
	     	        userInfo.put("email", email);
	     	        userInfo.put("profile",profile);
	        	 }
	        }
    
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}
	
	
	public void kakaoLogout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	}

}
