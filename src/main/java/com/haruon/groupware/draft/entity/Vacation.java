package com.haruon.groupware.draft.entity;

import lombok.Data;

@Data
public class Vacation {
	private Integer draNo;
	private Integer empNo;
	private String startDate;
	private String finishDate;
	private String kind;
	private String urgentPhone;

}
