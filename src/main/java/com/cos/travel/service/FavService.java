package com.cos.travel.service;

import org.springframework.stereotype.Service;

import com.cos.travel.model.Fav;
import com.cos.travel.model.Spot;
import com.cos.travel.model.User;
import com.cos.travel.repository.FavRepository;
import com.cos.travel.repository.SpotRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FavService {

	private final FavRepository favRepository;
	private final SpotRepository spotRepository;

	// 관광지 추천하기
	public void addFav(User user, int spotId) {
		Spot spot = spotRepository.findById(spotId).orElseThrow();
		favRepository.save(new Fav(user, spot));
	}

	// 관광지 추천 취소하기
	public void cancleFav(User user, int spotId) {
		Spot spot = spotRepository.findById(spotId).orElseThrow();
		Fav fav = favRepository.findByUserAndSpot(user, spot).orElseThrow();
		favRepository.delete(fav);

	}

	// 사용자가 이미 추천한 spot인지 체크
	public boolean isNotAlreadyFav(User user, Spot spot) {
		return favRepository.findByUserAndSpot(user, spot).isEmpty();
	}
}