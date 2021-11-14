package com.cos.travel.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Restaurant {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String restaurant;
	
	@Column(nullable = false)
	private String tag;
	
	@Column(nullable = false)
	private String town;
	
	@Column(nullable = false)
	private Double latitude;
	
	@Column(nullable = false)
	private Double longitude;
	
	@Column(nullable = false)
	private String address;
	
	@Column(nullable = false)
	private String call;
	
	@Column(nullable = false)
	private String hour;
	
	@Column(nullable = false)
	private String menu;
	
	@Column(nullable = false)
	private String imageurl;
	
	@Column(nullable = false)
	private String thumurl;
	
	@Column(nullable = false)
	private String detail;
	
	@Column
	private int recommend;	
}
