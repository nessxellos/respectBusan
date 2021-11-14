package com.cos.travel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.cos.travel.model.Tagrestaurant;

public interface TagrestaurantRepository extends JpaRepository<Tagrestaurant, Integer> {
	
}
