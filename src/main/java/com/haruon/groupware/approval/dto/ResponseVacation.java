package com.haruon.groupware.approval.dto;

import lombok.Data;

@Data
public class ResponseVacation {
	private String startDate;
	private Integer empNo;
	private String finishDate;
	private String kind;
	private String title;
	private String content;
}
