package com.haruon.groupware.draft.dto.request;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RequestUpdateVacationDraft {

	private Integer draNo;
	private Integer subEmpNumber;
	private String kind;
	private String urgentPhone;
	private String startDate;
	private String finishDate;
	private String title;
	private String textContent;
	private List<MultipartFile> formFile;
}
