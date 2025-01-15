package com.haruon.groupware.user.dto;

import lombok.Data;

@Data
public class RequestEmpUpdateInfo {
	private Integer empNo;
    private String postCode;
	private String address;
	private String phone;
	private String extNum;
	private String password;
}
