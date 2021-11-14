package com.cos.travel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.travel.model.Blog;

public interface BlogRepository extends JpaRepository<Blog, Integer> {
	
	public void deleteById(int id);
	
}