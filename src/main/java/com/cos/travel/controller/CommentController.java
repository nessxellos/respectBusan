package com.cos.travel.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.cos.travel.config.auth.PrincipalDetails;
import com.cos.travel.model.Comment;
import com.cos.travel.model.Spot;
import com.cos.travel.service.CommentService;
import com.cos.travel.util.Script;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CommentController {
	
private final CommentService commentService;
	
	// 댓글 작성
	@PostMapping("/comment/insert/{num}")
	public ResponseEntity<String> cInsert(@PathVariable int num,
			@RequestBody Comment comment,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		
		// jsp에서 spot 정보 못가져옴. 컨트롤러에서 처리
		Spot spot = new Spot();
		spot.setId(num);
		comment.setSpot(spot);
		comment.setUser(principalDetails.getUser());
		System.out.println(comment);
		commentService.insert(comment);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	// 댓글 삭제
   @DeleteMapping("/comment/{cid}/delete")
   public ResponseEntity<String> cDelete(@PathVariable int cid){
      
      commentService.deleteByCid(cid);
      
      String str = Script.back("댓글 삭제 완료");
      return new ResponseEntity<String>(str, HttpStatus.OK);
   }
}