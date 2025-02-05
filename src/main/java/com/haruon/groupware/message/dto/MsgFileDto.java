package com.haruon.groupware.message.dto;

import lombok.Data;

@Data
public class MsgFileDto { // 보낸쪽지함, 임시보관함
	private Integer msgNo;
//	private String fileNameE; // 수신인 파일명
//	private String extE; // 수신인 파일 확장자
	private String originNameM; // 첨부파일 원본이름
	private String fileNameM; // 첨부파일 DB 이름
	private String extM; // 첨부 파일 확장자
	
}
