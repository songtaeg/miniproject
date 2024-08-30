package com.example.test1.model;

import lombok.Data;

@Data
public class School {
	// stu 테이블 컬럼
	private String stuNo;
	private String name;
	private String id;
	private String grade;
	private String jumin;
	
	//department 테이블
	private String deptNo;
	private String dname;
	private String dpart;
	
	//professor 테이블
	private String profNo;
	private String profname;
}
