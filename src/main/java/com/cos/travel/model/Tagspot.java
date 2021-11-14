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
public class Tagspot {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String sight;
	
	@Column(nullable = false)
	private String tag1;
	
	@Column(nullable = false)
	private String tag2;	
	
	@Column(nullable = false)
	private String tag3;
	
	@Column(nullable = false)
	private String tag4;
	
	@Column(nullable = false)
	private String tag5;
	
	@Column(nullable = false)
	private String tag6;
	
	@Column(nullable = false)
	private String tag7;
	
	@Column(nullable = false)
	private String tag8;
	
	@Column(nullable = false)
	private String tag9;
	
	@Column(nullable = false)
	private String tag10;
}
