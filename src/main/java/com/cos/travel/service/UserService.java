package com.cos.travel.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.travel.model.User;
import com.cos.travel.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {
	
	private final UserRepository userRepository;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 회원 가입 진행
	@Transactional
	public void saveUser(User user) {
		
		String rawPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRole("ROLE_USER");
		userRepository.save(user);
	}
	
	// 회원정보 수정
	@Transactional
	public void updateUser(int id, User user) {
		User updateUser = userRepository.findById(id).get();
		
		String rawPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		updateUser.setPassword(encPassword);
		updateUser.setEmail(user.getEmail());
		updateUser.setAge(user.getAge());
		updateUser.setGender(user.getGender());
		updateUser.setPreference(user.getPreference());
	}
	
	// 회원 탈퇴
	@Transactional
	public void delete(int id) {
		userRepository.deleteById(id);
	}
	
	// 아이디 중복 확인
	@Transactional(readOnly = true)
	public boolean idDupChk(String email) {
		if (userRepository.countById(email)==1) {
			return true;
		}
		return false;
	}
	
	// 이메일 중복 확인
	@Transactional(readOnly = true)
	public boolean emDupChk(String email) {
		if (userRepository.countByEm(email)==1) {
			return true;
		}
		return false;
	}
	
	// 내가 추천한 여행지 목록 조회하기
	@Transactional(readOnly = true)
	public List<Integer> myFavList(int id) {
		return userRepository.myFavList(id);
	}
}