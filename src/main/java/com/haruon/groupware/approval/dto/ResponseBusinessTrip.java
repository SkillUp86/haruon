package com.haruon.groupware.approval.dto;

import lombok.Data;

@Data
public class ResponseBusinessTrip {
    private Integer empNo;
	private String place;
	private String startDate;
	private String finishDate;
	private String title;
	private String content;
}
