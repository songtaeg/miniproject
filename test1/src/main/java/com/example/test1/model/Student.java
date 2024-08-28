package com.example.test1.model;

import lombok.Data;

@Data
public class Student {
	// student 테이블 컬럼
	private String stuNo;
	private String stuName;
	private String stuDept;
	private String stuGrade;
	private String stuClass;
	private String stuGender;
	private String stuHeight;
	private String stuWeight;
	
	// subject 테이블 컬럼
	private String subNo;
	private String subName;
	private String subProf; 
	private String subGrade;
	private String subDept;
	
}
