package com.cos.travel.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
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
public class Blog {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;
	@Lob
	private String content;	
	private int count; // 조회수
	private String writer;
	private int replyCount;
	
	private String firstSrcPath;
	
	@JoinColumn(name = "userId")
	@ManyToOne(fetch = FetchType.EAGER)
	private User user;

	@OneToMany(mappedBy = "blog", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties("blog")
	private List<Reply> replies;

	@CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    private Date regdate;
}