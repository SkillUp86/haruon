package com.haruon.groupware.draft.dto.request;

import java.util.List;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RequestUpdateBusinessDraft {
	@NotNull
    private Integer draNo;
	@NotBlank
    private String type;
	@NotBlank(message = "장소 입력은 필수입니다.")
	private String place;
	@NotBlank(message = "시작날짜 입력은 필수입니다.")
	private String startDate;
	@NotBlank(message = "종료날짜 입력은 필수입니다.")
	private String finishDate;
	@NotBlank(message = "제목 입력은 필수입니다.")
	private String title;
	@NotBlank(message = "내용 입력은 필수입니다.")
	private String textContent;
	private List<MultipartFile> formFile;
}
