package com.cos.travel.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.cos.travel.model.Spot;

public interface SpotRepository extends PagingAndSortingRepository<Spot, Integer>, 
										JpaSpecificationExecutor<Spot> {
	
	// 맞춤 관광지 추천 쿼리
	@Query(value="select * from spot where spot.theme REGEXP ?1", nativeQuery = true)
	Page<Spot> recommandUser(String userPreference, Pageable pagealbe);
	
//	// 관광지명으로 검색하기
//	Page<Spot> findBySightContaining(String sight, Pageable pageable);
//		
//	// 제목 + 내용으로 검색하기
//	@Query(value = "SELECT * FROM spot WHERE " + "title LIKE %?1% or " + "detail LIKE %?1% ",
//			countQuery = "SELECT count(*) FROM spot WHERE title LIKE %?1% or detail LIKE %?1%",
//		    nativeQuery = true)
//	Page<Spot> findByText(String searchText, Pageable pageable);
//	
//	// 해시태그로 검색하기.
//	Page<Spot> findByTagContaining(String tag, Pageable pageable);
	
	// 테마별 관광지 조회하기 - 한가지 테마일때
	Page<Spot> findByThemeContaining(String theme, Pageable pageable);
	
	// 테마별 관광지 조회하기 - 두가지 테마일때
	@Query(value = "SELECT * FROM spot WHERE " + "theme LIKE %?1% or " + "theme LIKE %?2% ",
		    nativeQuery = true)
	Page<Spot> findByTwoTheme(String theme1, String theme2, Pageable pageable);
	
	// 성별에 따른 추천
	@Query(value="select gender from\r\n"
			+ "(select gender, max(maxcnt) as maxcount\r\n"
			+ "from\r\n"
			+ "(select gender, count(*) as maxcnt\r\n"
			+ "from\r\n"
			+ "(select user.id, gender, spot_id\r\n"
			+ "from user,fav\r\n"
			+ "where user.id=user_id and spot_id=?1) as newtable\r\n"
			+ "group by gender\r\n"
			+ "order by count(*) desc\r\n"
			+ ") as newtable2) as newtable3",nativeQuery=true)
	String favGender(int spotId);
	
	// 연령에 따른 추천
	@Query(value="select age from\r\n"
			+ "(select age, max(maxcnt) as maxcount\r\n"
			+ "from\r\n"
			+ "(select age, count(*) as maxcnt\r\n"
			+ "from\r\n"
			+ "(select user.id, age, spot_id\r\n"
			+ "from user,fav\r\n"
			+ "where user.id=user_id and spot_id=?1) as newtable\r\n"
			+ "group by age\r\n"
			+ "order by count(*) desc\r\n"
			+ ") as newtable2) as newtable3",nativeQuery=true)
	String favAge(int spotId);
}
