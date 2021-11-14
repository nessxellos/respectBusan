package com.cos.travel.service;

import java.util.Map;
import java.util.Optional;

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

import com.cos.travel.model.Spot;
import com.cos.travel.repository.SpotRepository;
import com.cos.travel.util.GetSort;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SpotService {

	private final SpotRepository spotRepository;
	
	// jpa specification 으로 검색 구현하기.
	// 단일 조건의 조회 Spec을 리턴.
	public Specification<Spot> getSingleSpec(Map<String, Object> map) {
		return new Specification<Spot>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Spot> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate p = cb.conjunction();
				if (map.get("sight") != null)
					p = cb.and(cb.like(root.get("sight"), "%" + (String) map.get("sight") + "%"));
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
	public Page<Spot> getGridList(Map<String, Object> map) throws Exception {
		int firstIdx = (int) map.get("pageIndex");
		int lastIdx = (int) map.get("recordCountPerPage");
		Pageable paging = PageRequest.of(firstIdx, lastIdx,
				GetSort.getSort((String) map.get("sortColumn"), (String) map.get("sortOrder")));
		Specification<Spot> spec = getSingleSpec(map);
		return spotRepository.findAll(spec, paging);
	}
	
	// 전체 관광지 목록 보기
	@Transactional(readOnly = true)
	public Page<Spot> list(Pageable pageable){
		return spotRepository.findAll(pageable);
	}
	
	// 관광지 상세보기
	@Transactional(readOnly = true)
	public Spot detail(int id) {
		return spotRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("상세보기 실패");
				});
	}
	
	// 맞춤 관광지 추천
	@Transactional(readOnly = true)
	public Page<Spot> recommand(String userPreference, Pageable pageable){
		return spotRepository.recommandUser(userPreference, pageable);
	}
	
	// 테마별 관광지 조회하기 - 한가지 테마일때
	@Transactional(readOnly = true)
	public Page<Spot> findByTheme(String theme, Pageable pageable) {
		return spotRepository.findByThemeContaining(theme, pageable);
	}
	
	// 테마별 관광지 조회하기 - 두가지 테마일때
	@Transactional(readOnly = true)
	public Page<Spot> findByTwoTheme(String theme1, String theme2, Pageable pageable) {
		return spotRepository.findByTwoTheme(theme1, theme2, pageable);
	}
	
	// 성별에 따른 추천
	@Transactional(readOnly=true)
	public String favGender(int spotId) {
		return spotRepository.favGender(spotId);
	}
	
	// 연령에 따른 추천
	@Transactional(readOnly=true)
	public String favAge(int spotId) {
		return spotRepository.favAge(spotId);
	}
	
	// 관광지 한건보기
	@Transactional(readOnly=true)
	public Optional<Spot> findById(int spotId) {
		return spotRepository.findById(spotId);
	}
}
