package com.cos.travel.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Spot {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String sight;
	
	@Column(nullable = false)
	private String theme;
	
	@Column(nullable = false)
	private String tag;
	
	@Column(nullable = false)
	private String town;
	
	@Column(nullable = false)
	private Double latitude;
	
	@Column(nullable = false)
	private Double longitude;
	
	@Column(nullable = false)
	private String title;
	
	@Column(nullable = false)
	private String address;
	
	@Column(nullable = false)
	private String holiday;
	
	@Column(nullable = false)
	private String hour;
	
	@Column(nullable = false)
	private String imageurl;
	
	@Column(nullable = false)
	private String thumurl;
	
	@Column(nullable = false)
	private String detail;
	
	@Column(nullable = false)
	private Double score;
	
	@Column
	private int recommend;
	
	@OneToMany(mappedBy = "spot", cascade = CascadeType.ALL)
	@JsonIgnoreProperties("spot")
	private List<Comment> comments;
	
	// 추천 기능을 위한 user 정보
	@ManyToOne
	private User user;
	
	// 전체 조회 화면에서 추천수를 노출하기 위한 Fav 필드 (아직 미구현)
	// 양방향 매핑
	@OneToMany(mappedBy="spot",cascade=CascadeType.ALL)
	@JsonIgnoreProperties("spot")
	Set<Fav> favList = new HashSet<>();
}
