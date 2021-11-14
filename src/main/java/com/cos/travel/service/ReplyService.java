package com.cos.travel.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.travel.model.Reply;
import com.cos.travel.repository.ReplyRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReplyService {
	
	private final ReplyRepository replyRepository;
	
	// 댓글 쓰기
	@Transactional
	public void insert(Reply reply) {
		replyRepository.save(reply);
	}
	
	// 댓글 리스트
	@Transactional
	public List<Reply> list(int num){
		return replyRepository.findByblogId(num);
	}
	
	// 댓글 갯수
	@Transactional
	public int countReply(int num) {
		return replyRepository.countByblogId(num);
	}
}
