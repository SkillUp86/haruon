package com.haruon.groupware.approval.entity;

import lombok.Data;

@Data
public class ApprovalEntity {
	private Integer appNo;
	private Integer draNo;
	private Integer midApp;
	private Integer finalApp;
	private String state;
	private String reasonDenial;
	private String midAppDate;
	private String finalAppDate;
}   
    