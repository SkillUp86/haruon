package com.haruon.groupware.draft.dto.request;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RequestUpdateSalesDraft {

	private Integer draNo;
	private Integer fraNo;
	private String ym;
	private Long revenue;
	private String title;
	private String textContent;
	private List<MultipartFile> formFile;
}
