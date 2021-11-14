package com.cos.travel.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.travel.config.auth.PrincipalDetails;
import com.cos.travel.model.Spot;
import com.cos.travel.model.User;
import com.cos.travel.service.SpotService;
import com.cos.travel.service.UserService;
import com.cos.travel.util.Script;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserController {
	
	private final UserService userService;
	private final SpotService spotService;
	
	// 로그인화면 이동
	@GetMapping("/login")
	public String loginForm() {
		return "user/login";
	}
	
	// 회원가입화면 이동
	@GetMapping("/join")
	public String joinForm() {
		return "user/join";
	}
	
   // 회원가입
   @PostMapping("/join")
   @ResponseBody
   public ResponseEntity<String> saveUser(User user) {
      
      String str = null;
      
      if(userService.idDupChk(user.getUsername()) || userService.emDupChk(user.getEmail())) {
         str = Script.back("아이디 및 이메일 중복 확인을 해주세요.");
         return new ResponseEntity<String>(str, HttpStatus.OK);
      }
      userService.saveUser(user);
      
      str = Script.href("회원가입 완료", "/login");
      return new ResponseEntity<String>(str, HttpStatus.OK);
   }
	
	// 아이디 중복확인
	@GetMapping("/etc/idDupChk")
	public String idCheck(String id, Model model) {
				
		model.addAttribute("isIdDup", userService.idDupChk(id));
		model.addAttribute("id", id);
		
		return "/etc/joinIdDupChk";
	}
		
	// 이메일 중복확인
	@GetMapping("/etc/EmDupChk")
	public String emCheck(String email, Model model) {
				
		model.addAttribute("isEmDup", userService.emDupChk(email));
		model.addAttribute("email", email);
		
		return "/etc/joinEmDupChk";
	}
	
	// 마이 페이지 이동
	@GetMapping("/user/{id}/myPage")
	public String myPage(@PathVariable int id,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		return "user/myPage";
	}
		
	// 회원정보 수정 폼 이동
	@GetMapping("/user/{id}/update")
	public String update(@PathVariable int id,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		return "user/update";
	}
	
	// 회원정보 수정
	@PutMapping("/user/update")
	@ResponseBody
	public ResponseEntity<String> updateUser(
			@AuthenticationPrincipal PrincipalDetails principalDetails, User user){
		int id = principalDetails.getUser().getId();
		userService.updateUser(id, user);
		String str = Script.href("회원정보 수정 완료", "/user/"+id+"/myPage");
		return new ResponseEntity<String> (str, HttpStatus.OK);
	}
	
	
	// 삭제
	@DeleteMapping("/user/{id}/delete")
	@ResponseBody
	public ResponseEntity<String> delete(@PathVariable int id, HttpSession session){
		session.invalidate();
		userService.delete(id);
		
		String str = Script.href("회원탈퇴 완료", "/");
		return new ResponseEntity<String> (str, HttpStatus.OK);
	}	
	
	 // 내가 추천한 여행지 목록으로 이동
	@GetMapping("user/{id}/favList")
	public String favList(@PathVariable int id, @AuthenticationPrincipal PrincipalDetails principalDetails,
			Model model) {
		// 내가 추천한 Spot의 id 리스트
		List<Integer> favList = userService.myFavList(id);
		// 내가 추천한 Spot 리스트
		List<Spot> spotList = new ArrayList<Spot>();

		if (favList != null) {
			for (Integer spotId : favList) {
				spotList.add(spotService.findById(spotId).orElseThrow());
			}
		}
		model.addAttribute("spots", spotList);
		return "user/favList";
	}
}