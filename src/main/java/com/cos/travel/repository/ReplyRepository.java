package com.cos.travel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.travel.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Integer>{

	// 댓글 목록 
	@Query(value="SELECT * FROM reply WHERE blogId=?1", nativeQuery = true) 
	public List<Reply> findByblogId(int num);
	
	@Query(value="SELECT count(*) FROM reply WHERE blogId=?1", nativeQuery = true)
	public int countByblogId(int num);
}