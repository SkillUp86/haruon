package com.haruon.groupware.message.entity;

import lombok.Data;

@Data
public class MsgFile {
	private Integer msgfNo;
	private Integer msgNo;
	private String originName;
	private String fileName;
	private String ext;
	private String kind;
	private Long size;
	private String createDate;

}
