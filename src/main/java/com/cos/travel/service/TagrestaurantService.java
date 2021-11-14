package com.cos.travel.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.travel.model.Tagrestaurant;
import com.cos.travel.repository.TagrestaurantRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TagrestaurantService {

	private final TagrestaurantRepository tagrestaurantRepository;
	
	// 전체 태그 가져오기 보기
	@Transactional(readOnly = true)
	public List<Tagrestaurant> list(){
		return tagrestaurantRepository.findAll();
	}
	// 관광지 상세보기
	@Transactional(readOnly = true)
	public Tagrestaurant detail(int id) {
		return tagrestaurantRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("상세보기 실패");
				});
	}
}
