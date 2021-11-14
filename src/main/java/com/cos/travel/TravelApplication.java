package com.cos.travel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication	// 얘가 기본적으로 컴포넌트 스캔 등을 다 쓸 수 있도록 만들어주는 녀석임
public class TravelApplication {

	public static void main(String[] args) {
		SpringApplication.run(TravelApplication.class, args);
	}
}