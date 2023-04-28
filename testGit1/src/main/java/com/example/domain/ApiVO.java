package com.example.domain;

import lombok.Data;

@Data
public class ApiVO {

	private Long id;
	private Long password;
	private String name;
	private String email;
	private String nickname;
}
