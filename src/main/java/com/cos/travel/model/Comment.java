package com.cos.travel.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.CreationTimestamp;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Comment {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cid;
	
	@Column(nullable = false, length = 500)
	private String content;
	private String writer;
	private int emotion;
	
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    private Date regdate;
	
    // 외래키 제약
    @ManyToOne
    @JoinColumn(name="s_id")
    private Spot spot;
    
    // 외래키 제약
    @ManyToOne
    @JoinColumn(name="u_id")
    private User user;    
}