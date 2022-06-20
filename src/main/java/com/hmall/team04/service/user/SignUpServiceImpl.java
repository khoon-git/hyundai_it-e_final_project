package com.hmall.team04.service.user;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hmall.team04.dao.user.SignUpDAO;
import com.hmall.team04.dto.user.SignUpRequestDTO;
import com.hmall.team04.exception.AlreadyExistingEmailException;
import com.hmall.team04.exception.AlreadyExistingUserIdException;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
@Log4j
@RequiredArgsConstructor
public class SignUpServiceImpl implements SignUpService{
	
	private final SignUpDAO signUpDAO;
	private final PasswordEncoder passwordEncoder;
	
	@Transactional
	@Override
	public void signUp(SignUpRequestDTO signUpRequestDTO) throws Exception {
		
		// user_id 중복 검사
		String foundUserId = signUpDAO.checkUserIdYn(signUpRequestDTO.getUser_id());
		log.info("서비스단 : "+ foundUserId);
		
        if (foundUserId.equals("Y")) {
        	throw new AlreadyExistingUserIdException("이미 존재하는 사용자 ID : "+ signUpRequestDTO.getUser_id());
        }
        
        // email 중복 검사
        String foundEmail = signUpDAO.checkUserEmailYn(signUpRequestDTO.getEmail());
        if (foundEmail.equals("Y")) {
        	throw new AlreadyExistingEmailException("이미 존재하는 사용자 Eamil : "+ signUpRequestDTO.getEmail());
        }
        
        signUpRequestDTO.setPassword(passwordEncoder.encode(signUpRequestDTO.getPassword()));
        
        // 권한 추가 처음 회원가입시 ROLE_USER 임
        if (signUpRequestDTO.getAuth() == null) {
        	signUpRequestDTO.setAuth("ROLE_USER");
        	log.info("권한 추가 : "+signUpRequestDTO.getAuth());
        }
        
        // 휴대폰번호 숫제 빼고 다 제거
        signUpRequestDTO.setHp_no(signUpRequestDTO.getHp_no().replaceAll( "[^0-9]", ""));
        try {
        	signUpDAO.insertUser(signUpRequestDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        
	}
	
	// user_id 중복 검사
	@Override
	public String checkIdDup(String userId) throws Exception {
		
		return signUpDAO.checkUserIdYn(userId); // userId가 존재하면 Y, 존재하지 않으면 N 리턴.
	}
	
	// email 중복 검사
	@Override
	public String checkEmailDup(String email) throws Exception {
		
		return signUpDAO.checkUserEmailYn(email); // email이 존재하면 Y, 존재하지 않으면 N 리턴.;
	}

	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) throws Exception {
		String api_key = "NCSXIGO82HQ5XW8W";
	    String api_secret = "VCDJZ3RETIS53LXLORCMSUGKCBTIMAR3";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "010-4053-6722");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[Hmall 회원가입] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "team04 app 1.1"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        log.info(obj.toString());
	      } catch (CoolsmsException e) {
	    	log.info(e.getMessage());
	    	log.info(e.getCode());
	      }
		
	}

}
