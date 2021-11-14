package com.cos.travel.service;

import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.travel.model.Restaurant;
import com.cos.travel.repository.RestaurantRepository;
import com.cos.travel.util.GetSort;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class RestaurantService {

	private final RestaurantRepository restaurantRepository;
	
	// jpa specification 으로 검색 구현하기.
	// 단일 조건의 조회 Spec을 리턴.
	public Specification<Restaurant> getSingleSpec(Map<String, Object> map) {
		return new Specification<Restaurant>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Restaurant> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate p = cb.conjunction();
				if (map.get("restaurant") != null)
					p = cb.and(cb.like(root.get("restaurant"), "%" + (String) map.get("restaurant") + "%"));
				if (map.get("detail") != null)
					p = cb.and(cb.like(root.get("detail"), "%" + (String) map.get("detail") + "%"));
				if (map.get("tag") != null)
					p = cb.and(cb.like(root.get("tag"), "%" + (String) map.get("tag") + "%"));
				return p;
			}
		};
	}

	// getSingleSpec() 호출하기
	@Transactional
	public Page<Restaurant> getGridList(Map<String, Object> map) throws Exception {
		int firstIdx = (int) map.get("pageIndex");
		int lastIdx = (int) map.get("recordCountPerPage");
		Pageable paging = PageRequest.of(firstIdx, lastIdx,
				GetSort.getSort((String) map.get("sortColumn"), (String) map.get("sortOrder")));
		Specification<Restaurant> spec = getSingleSpec(map);
		return restaurantRepository.findAll(spec, paging);
	}
	// 전체 맛집 목록 보기
	@Transactional(readOnly = true)
	public Page<Restaurant> list(Pageable pageable){
		return restaurantRepository.findAll(pageable);
	}
	
	// 맛집 상세보기
	@Transactional(readOnly = true)
	public Restaurant detail(int id) {
		return restaurantRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("상세보기 실패");
				});
	}
	
//	// 맛집 검색하기
//	@Transactional(readOnly = true)
//	public Page<Restaurant> searchByText(SearchDto dto, Pageable pageable) {
//		Page<Restaurant> restaurantList = null;
//		switch (dto.getGubun()) {
//			case "가게이름":
//				restaurantList = restaurantRepository.findByRestaurantContaining(dto.getText(), pageable);
//				break;
//			case "제목 내용":
//				restaurantList = restaurantRepository.findByText(dto.getText(), pageable);
//				break;
//			case "해시태그":
//				restaurantList = restaurantRepository.findByTagContaining(dto.getText(), pageable);
//		}
//		return restaurantList;
//	}
}
