package com.haruon.groupware.user.dto;

import lombok.Data;

@Data
public class ResponseEmpInfo {
	private Integer empNo;
	private String email;
	private Integer depNo;
	private String dname;
	private String ename;
	private String location;
	private String extNum;
	private String phone;
	private String address;
	private String postCode;
	private String gender;
	private String birth;
	private String joinDate;
	private String exitDate;
	private String fileName;
	private String ext;
	private String signfileName;
	private String signExt;
}
