package com.haruon.groupware.draft.dto.response;

import lombok.Data;

@Data
public class ResponseReferencesList {
	private Integer draNo;
	private String type;
	private String draftType; 
	private String title;
	private String content;
	private String createDate;
	private String approvalState; 
	private Integer refNo;
	
}
