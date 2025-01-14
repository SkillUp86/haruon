package com.haruon.groupware.draft.dto.request;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RequestUpdateBasicDraft {
    private Integer draNo; 
	private String title;
	private String textContent;
	private List<MultipartFile> formFile;
}
