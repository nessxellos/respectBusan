package com.cos.travel.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.cos.travel.model.Restaurant;

public interface RestaurantRepository extends PagingAndSortingRepository<Restaurant, Integer>, 
											  JpaSpecificationExecutor<Restaurant> {
	
	// 가게이름으로 검색하기
	Page<Restaurant> findByRestaurantContaining(String restaurant, Pageable pageable);
		
	// 제목 + 내용으로 검색하기
	@Query(value = "SELECT * FROM restaurant WHERE " + "title LIKE %?1% or " + "detail LIKE %?1% ",
			countQuery = "SELECT count(*) FROM restaurant WHERE title LIKE %?1% or detail LIKE %?1%",
		    nativeQuery = true)
	Page<Restaurant> findByText(String searchText, Pageable pageable);
	
	// 해시태그로 검색하기.
	Page<Restaurant> findByTagContaining(String tag, Pageable pageable);
}
