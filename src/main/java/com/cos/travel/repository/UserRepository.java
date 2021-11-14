package com.cos.travel.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.cos.travel.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByUsername(String username);

	public void deleteById(int id);

	User findByEmail(String email);
	
	Page<User> findByUsernameContaining(String username, Pageable pageable);
	Page<User> findByEmailContaining(String email, Pageable pageable);
	
	// 아이디 중복체크
	@Query(value = "SELECT COUNT(*) FROM user WHERE username = ?1",
			nativeQuery = true)
	public int countById(String id);

	// 이메일 중복체크
	@Query(value = "SELECT COUNT(*) FROM user WHERE email = ?1",
			nativeQuery = true)
	public int countByEm(String email);
	
	// 내가 추천한 여행지 목록 조회하기
	@Query(value="select spot_id\n"
			+ "from fav, spot\n"
			+ "where fav.spot_id=spot.id and fav.user_id=?1", nativeQuery=true)
	public List<Integer> myFavList(int id);
}