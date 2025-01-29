package com.haruon.groupware.draft.dto.request;

import java.util.List;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RequestUpdateSalesDraft {
	@NotNull
	private Integer draNo;
	@NotBlank
	private String type;
	@NotNull(message = "프랜차이즈 선택은 필수입니다.")
	private Integer fraNo;
	@NotBlank(message = "연월 입력은 필수입니다.")
	private String ym;
	@NotNull(message = "매출액 입력은 필수입니다.")
	private Long revenue;
	@NotBlank(message = "제목 입력은 필수입니다.")
	private String title;
	@NotBlank(message = "내용 입력은 필수입니다.")
	private String textContent;
	private List<MultipartFile> formFile;
}
