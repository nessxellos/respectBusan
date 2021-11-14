package com.cos.travel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.travel.model.Attach;

public interface AttachRepository extends JpaRepository<Attach, String> {
	
	@Query(value = "SELECT * FROM attach WHERE bno = ?1",
			nativeQuery = true)
	public List<Attach> getAttachesBybNo(int id);
		
}
