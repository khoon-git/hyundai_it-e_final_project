package com.hmall.team04.controller.user;


import java.security.Principal;

import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.user.SignUpRequestDTO;
import com.hmall.team04.exception.AlreadyExistingEmailException;
import com.hmall.team04.exception.AlreadyExistingUserIdException;
import com.hmall.team04.service.user.SignUpService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/signUp")
@RequiredArgsConstructor
public class SignUpController {
	
	private final SignUpService signUpService;
	

	@GetMapping("/signUpStart")
	public String signUpStart(Principal principal) {
		log.info("회원 구분 페이지 요청");
		if (principal == null) {
			return "user.signup.signUpStart";
		}
		return "redirect:/";
	}
	
	@GetMapping("/step1")
	public String step1() {
		log.info("약관동의 페이지 요청");
		return "user.signup.step1";
	}
	
	@PostMapping("/step2")
	   public String step2(@RequestParam(value="check_agree0") String check_agree0,
			   			   @RequestParam(value="check_agree1") String check_agree1,
			   			   Model model) {
		
		
		log.info("개인정보 입력 페이지 요청");
		log.info("[필수] 이용 약관 : " + check_agree0);
		log.info("[필수] 개인정보 수집.이용 동의 : " + check_agree1);
		
		// 필수 동의 확인
		if(check_agree0.equals("Y") && check_agree1.equals("Y")) {
			model.addAttribute("signUpRequestDTO", new SignUpRequestDTO());
			return "user.signup.step2";
		} else {
			return "redirect:/";
		}
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/step3")
	public String step3(Principal principal) {
		return "redirect:/";
	}
	
	@PostMapping("/step3")
	public String step3(@Valid @ModelAttribute SignUpRequestDTO signUpRequestDTO, BindingResult br) throws Exception{
		log.info("가입 완료 페이지 요청");
		log.info(signUpRequestDTO.toString());
		
		//@Valid
		if(br.hasErrors()) {
			log.info("검증 에러 : "+br.toString());
			
			//패스워드 일치 검사
			boolean check = signUpRequestDTO.isPwEqualToCheckPw();
			if(!check) {
				log.info("패스워드 불일치");
	            br.rejectValue("check_password", "noMatch", "비밀번호가 일치하지 않습니다.");
	            return "user.signup.step2";
	        }

			return "user.signup.step2";
		}
		
		
		try {
			signUpService.signUp(signUpRequestDTO);
			return "user.signup.step3";
			
		} catch (AlreadyExistingUserIdException e) {
			log.info(e.getMessage());
			br.rejectValue("user_id", "duplicate", "이미 가입된 ID입니다.");
			return "user.signup.step2";
			
		} catch (AlreadyExistingEmailException e) {
			log.info(e.getMessage());
			e.printStackTrace();
			br.rejectValue("email", "duplicate", "이미 가입된 Email입니다.");
			return "user.signup.step2";
		}
	}
	
	// user_id 중복확인
	@PostMapping(value = "/checkIdDupJSON", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String checkIdDupJSON(@RequestBody String userId) { // Y, N 만 보내주면 되기 때문에 String으로 리턴 : ajax에서 받을 때 dataType: 'text'
		
		log.info("중복 확인할 아이디 : "+userId);
		//아이디 중복 확인
		String checkIdDupJSON;
		try {
			checkIdDupJSON = signUpService.checkIdDup(userId);
			log.info("아이디 중복 여부: "+checkIdDupJSON);
			return checkIdDupJSON;  //JSON으로 데이터 리턴
		} catch (Exception e) {
			e.printStackTrace();
			return "Y";
		}
		
	}
	
	// email 중복확인
	@PostMapping(value = "/checkEmailDupJSON", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String checkEmailDupJSON(@RequestBody String email) { // Y, N 만 보내주면 되기 때문에 String으로 리턴 : ajax에서 받을 때 dataType: 'text'
		
		log.info("중복 확인할 이메일 : "+email);
		//이메일 중복 확인
		String checkEmailDupJSON;
		try {
			checkEmailDupJSON = signUpService.checkEmailDup(email);
			log.info("아이디 중복 여부: "+checkEmailDupJSON);
			return checkEmailDupJSON;  //JSON으로 데이터 리턴
		} catch (Exception e) {
			e.printStackTrace();
			return "Y";
		}
		
	}
	
	
	@GetMapping(value = "/phoneCheck", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		try {
			signUpService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Integer.toString(randomNumber);
	}
	
	
}
