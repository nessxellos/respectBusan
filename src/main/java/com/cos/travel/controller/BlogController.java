package com.cos.travel.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cos.travel.config.auth.PrincipalDetails;
import com.cos.travel.model.Attach;
import com.cos.travel.model.Blog;
import com.cos.travel.service.AttachService;
import com.cos.travel.service.BlogService;
import com.cos.travel.service.ReplyService;
import com.cos.travel.util.Script;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BlogController {

	private final BlogService blogService;
	private final ReplyService replyService;
	private final AttachService attachService;

	// 여행이야기 이동, 리스팅
	@GetMapping("/blog/blogMain")
	public String blog(Model model, /*@PathVariable int id,*/
			@PageableDefault(size = 3, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		Page<Blog> lists = blogService.list(pageable);
		//Blog blog = blogService.detail(id);
		//List<Attach> attach = attachService.getAttachesBybNo(id);
		model.addAttribute("lists", lists);
		//model.addAttribute("blog", blog);
		//model.addAttribute("attach", attach);
		return "blog/blogMain";
	}

	// 블로그 쓰기 화면으로 이동
	@GetMapping("/blog/blogWrite")
	public String blogWrite() {
		return "blog/blogWrite";
	}
	
	// 글 쓰기
	@PostMapping("/blog/blogWrite")
	public ResponseEntity<String> blogWrite(Blog blog, HttpServletRequest request,
			List<MultipartFile> files, @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception {
		
		blog.setUser(principalDetails.getUser());
		// 임의 데이터 입력
		blog.setCount(0);
		blog.setReplyCount(0);
		
		// 업로드 경로 지정
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/resources/upload/");
		// 메서드로 업로드 경로 지정
		File uploadPath = new File(realPath, getDateFolder());
		
		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		List<Attach> attachList = new ArrayList<Attach>();
		
		for (MultipartFile multipartFile : files) {
			if (multipartFile.isEmpty()) {
				continue;
			}

			String originalFilename = multipartFile.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid.toString() + "_" + originalFilename;
			multipartFile.transferTo(new File(uploadPath, uploadFilename));
			
			Attach attach = new Attach();
			attach.setUuid(uuid.toString());
			attach.setUploadpath(getDateFolder());
			attach.setFilename(multipartFile.getOriginalFilename());
			attach.setSrcPath("/resources/upload/"+getDateFolder()+"/"+uuid.toString()+"_"+multipartFile.getOriginalFilename());

			attachList.add(attach);
		} // for
		for (int i=0; i<1; i++) {
			blog.setFirstSrcPath(attachList.get(i).getSrcPath());
		}
		blogService.insertBlogAndAttaches(blog, attachList);
		
		String str = Script.href("여행이야기 등록 완료", "/blog/blogMain");
		return new ResponseEntity<String> (str, HttpStatus.OK);
	}
	
	// 파일업로드 폴더 생성(폴더이름 : 업로드날짜)
	private String getDateFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str;
	}
		
	// 블로그 상세 보기
	@GetMapping("/blog/blogDetail/{id}")
	public String findById(@PathVariable int id, Model model) {
		
		String username = "";
		Object principal = SecurityContextHolder. getContext(). getAuthentication(). getPrincipal();
		
		if (principal instanceof UserDetails) {
			username = ((UserDetails)principal). getUsername();
		} else {
			username = principal. toString();
		}
		
		Blog blog = blogService.detail(id);
		List<Attach> attach = attachService.getAttachesBybNo(id);
		
		if (!username.equals(blog.getUser().getUsername())) {
			blog.setCount(blog.getCount()+1);
		}
		
		blogService.update(id, blog);
		model.addAttribute("blog", blog);
		// 댓글 리스트
		model.addAttribute("rlist", replyService.list(id));
		// 댓글 개수
		model.addAttribute("listCount", replyService.countReply(id));
		model.addAttribute("attach", attach);
		return "blog/blogDetail";
	}
	
	// 블로그 수정 이동
	@GetMapping("/blog/blogUpdate/{id}")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("blog", blogService.view(id));
		return "blog/blogupdateForm";
	}
	
	// 블로그 삭제
	@DeleteMapping("/blog/blogUpdate/{id}")
	@ResponseBody
	public String delete(@PathVariable int id) {
		blogService.delete(id);
		return "success";
	}
}