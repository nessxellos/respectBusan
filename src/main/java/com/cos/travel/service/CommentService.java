package com.cos.travel.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.travel.model.Comment;
import com.cos.travel.repository.CommentRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CommentService {
	
	private final CommentRepository commentRepository;
	
	// 댓글 쓰기
	@Transactional
	public void insert(Comment comment) {
		commentRepository.save(comment);
	}
	
	// 댓글 리스트
	@Transactional
	public List<Comment> list(int num){
		return commentRepository.findByS_id(num);
	}
	
	// 댓글 갯수
	@Transactional
	public int countComment(int num) {
		return commentRepository.countByS_id(num);
	}
	// 댓글 삭제
   @Transactional
   public void deleteByCid(int cid) {
      commentRepository.deleteById(cid);
   }

}
