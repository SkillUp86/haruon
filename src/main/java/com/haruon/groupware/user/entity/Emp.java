package com.haruon.groupware.user.entity;

import lombok.Data;

@Data
public class Emp {
	private Integer empNo;
	private String email;
	private String empPw;
	private Integer depNo;
	private String ename;
	private String location;
	private String extNum;
	private	String phone;
	private String address;
	private String postCode;
	private String gender;
	private String birth;
	private Integer totalLeave;
	private Integer usedLeave;
	private String pwUpdate;
	private String joinDate;
	private String leaveDate;
	private String dname;
}
