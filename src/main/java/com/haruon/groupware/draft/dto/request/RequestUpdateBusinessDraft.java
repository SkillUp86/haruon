package com.haruon.groupware.draft.dto.request;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RequestUpdateBusinessDraft {
    private Integer draNo;
    private String type;
	private String place;
	private String startDate;
	private String finishDate;
	private String title;
	private String textContent;
	private List<MultipartFile> formFile;
}
