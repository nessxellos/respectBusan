package com.cos.travel.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
@Configuration	// 환경설정 파일
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	// 암호화를 하기 위해서 Bean 객체 생성, xml에서 빈객체를 만들던 것과 같은 의미
	@Bean
	public BCryptPasswordEncoder encode() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();		// csrf를 계속 사용한다고 하면, 내가 토큰 값을 계속해서 전달 해줘야함
		http.authorizeRequests()	// 권한을 받아서 처리할예정
			.antMatchers("/user/**", "/blog/**", "/busan/recommand").authenticated()
			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
			.anyRequest().permitAll()
			.and()
				.formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/login")
				.defaultSuccessUrl("/");
	}
}