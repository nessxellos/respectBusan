package com.cos.travel.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.travel.model.Fav;
import com.cos.travel.model.Spot;
import com.cos.travel.model.User;

public interface FavRepository extends JpaRepository<Fav, Integer> {
	
	Optional<Fav> findByUserAndSpot(User user, Spot spot);
}