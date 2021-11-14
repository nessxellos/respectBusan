package com.cos.travel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cos.travel.model.Attach;
import com.cos.travel.repository.AttachRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AttachService {
	
	private final AttachRepository attachRepository;

	public List<Attach> getAttachesBybNo(int id) {
		return attachRepository.getAttachesBybNo(id);
	}
	
}
