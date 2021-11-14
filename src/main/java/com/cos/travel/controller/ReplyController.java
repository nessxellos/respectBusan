package com.cos.travel.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.cos.travel.config.auth.PrincipalDetails;
import com.cos.travel.model.Blog;
import com.cos.travel.model.Reply;
import com.cos.travel.service.ReplyService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReplyController {
	
private final ReplyService replyService;
	
	// 댓글 작성
	@PostMapping("/reply/insert/{num}")
	public ResponseEntity<String> rInsert(@PathVariable int num,
			@RequestBody Reply reply,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		
		// jsp에서 spot 정보 못가져옴. 컨트롤러에서 처리
		Blog blog = new Blog();
		blog.setId(num);
		reply.setBlog(blog);
		reply.setUser(principalDetails.getUser());
		System.out.println(reply);
		replyService.insert(reply);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}