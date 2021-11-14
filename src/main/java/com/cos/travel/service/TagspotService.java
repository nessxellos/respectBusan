package com.cos.travel.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.travel.model.Tagspot;
import com.cos.travel.repository.TagspotRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TagspotService {

	private final TagspotRepository tagspotRepository;
	
	// 전체 태그 가져오기 보기
	@Transactional(readOnly = true)
	public List<Tagspot> list(){
		return tagspotRepository.findAll();
	}
	// 관광지 상세보기
	@Transactional(readOnly = true)
	public Tagspot detail(int id) {
		return tagspotRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("상세보기 실패");
				});
	}
}
