package com.cos.travel.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Attach {
	
	@Id @Column(nullable = false)
	private String uuid;
	private String uploadpath;
	private String filename;
	private String srcPath;
	private int bno;
	
}
