package com.haruon.groupware.message.entity;

import lombok.Data;

@Data
public class MsgSender {
	private Integer msgsNo;
	private Integer msgNo;
	private Integer empNo;
	private String state;
	private String sendDate;
}
