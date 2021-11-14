package com.cos.travel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.travel.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	
	// 댓글 목록 
	@Query(value="SELECT * FROM comment WHERE s_id=?1", nativeQuery = true) 
	public List<Comment> findByS_id(int num);
	
	@Query(value="SELECT count(*) FROM comment WHERE s_id=?1", nativeQuery = true)
	public int countByS_id(int num);
}
