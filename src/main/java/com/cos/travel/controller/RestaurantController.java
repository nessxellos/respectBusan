package com.cos.travel.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.travel.model.Restaurant;
import com.cos.travel.model.Tagrestaurant;
import com.cos.travel.service.RestaurantService;
import com.cos.travel.service.TagrestaurantService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class RestaurantController {

	private final RestaurantService restaurantService;
	private final TagrestaurantService tagrestaurantService;
	
	// 인기 맛집으로 이동하기
	@GetMapping("/restaurant/restaurant")
	public String popular(Model model,
			@PageableDefault(size = 9, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {
		model.addAttribute("restaurants", restaurantService.list(pageable));
		return "restaurant/restaurant";
	}
	
	// 맛집 상세보기
	@GetMapping("/restaurant/{id}")
	public String findById(@PathVariable int id, Model model1, Model model2) {
		Restaurant restaurant = restaurantService.detail(id);
		Tagrestaurant tagrestaurant = tagrestaurantService.detail(id);
		model1.addAttribute("restaurant", restaurant);
		model2.addAttribute("tagrestaurant", tagrestaurant);
		return "restaurant/restaurantDetail";
	}
	
	// 맛집 검색하기.
	@GetMapping("/restaurant/search")
	public String searchSight(Model model, 
			@RequestParam(required = false) String restaurant, 
			@RequestParam(required = false) String detail, 
			@RequestParam(required = false) String tag,
			@RequestParam(required = false) int page) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		// 여기서 관광지명, 제목+내용, 해시태그 조건 분기
		if(restaurant != null) {
			map.put("restaurant", restaurant);
			model.addAttribute("menu", "restaurant");
			model.addAttribute("searchText", restaurant);
		}
		if(detail != null) {
			map.put("detail", detail);
			model.addAttribute("menu", "detail");
			model.addAttribute("searchText", detail);
		}
		if(tag != null) {
			map.put("tag", tag);
			model.addAttribute("menu", "tag");
			model.addAttribute("searchText", tag);
		}
		map.put("pageIndex", page); // 첫 인덱스
		map.put("recordCountPerPage", 5);
		map.put("sortColumn", "id");
		map.put("sortOrder", "desc");
		Page<Restaurant> restaurants = restaurantService.getGridList(map);
		System.out.println("관광지 출력 확인 : " + restaurants);
		model.addAttribute("restaurants", restaurants);
		return "restaurant/searchList";
	}
}
