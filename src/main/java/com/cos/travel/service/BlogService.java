package com.cos.travel.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.travel.model.Attach;
import com.cos.travel.model.Blog;
import com.cos.travel.repository.AttachRepository;
import com.cos.travel.repository.BlogRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BlogService {

	private final BlogRepository blogRepository;
	private final AttachRepository attachRepository;

	// 여행이야기 쓰기
	@Transactional
	public void insertBlogAndAttaches(Blog blog, List<Attach> attachList) {

		blogRepository.save(blog);
		
		// 파일첨부 갯수만큼 반복
		if (attachList.size()>0) {
			for (Attach attach : attachList) {
				attach.setBno(blog.getId());
				attachRepository.save(attach);
			}
		}
	}

	// 블로그 리스트
	@Transactional(readOnly = true)
	public Page<Blog> list(Pageable pageable) {
		return blogRepository.findAll(pageable);
	}

	// 블로그 상세보기
	@Transactional(readOnly = true)
	public Blog detail(int id) {
		return blogRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("상세보기 실패");
		});
	}

	// 조회수
	@Transactional
	public Blog view(int id) {
		Blog blog = blogRepository.findById(id).get();
		return blog;
	}

	// 블로그 수정하기
	@Transactional
	public void update(int id, Blog requestBlog) {
		Blog blog = blogRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("게시글 쓰기 실패");
		});
		blog.setTitle(requestBlog.getTitle());
		blog.setContent(requestBlog.getContent());
	}

	// 블로그 삭제
	@Transactional
	public void delete(int id) {
		blogRepository.deleteById(id);
	}
}