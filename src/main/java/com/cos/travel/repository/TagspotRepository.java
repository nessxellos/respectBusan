package com.cos.travel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.cos.travel.model.Tagspot;

public interface TagspotRepository extends JpaRepository<Tagspot, Integer> {
	
}
