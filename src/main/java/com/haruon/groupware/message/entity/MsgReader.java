package com.haruon.groupware.message.entity;

import lombok.Data;

@Data
public class MsgReader {
	private Integer msgrNo;
	private Integer msgNo;
	private Integer empNo;
	private String state;
	private String readDate;
}
