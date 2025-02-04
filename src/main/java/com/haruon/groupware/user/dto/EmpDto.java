package com.haruon.groupware.user.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
public class EmpDto {
	private Integer empNo;
	@NotBlank
	private String ename;
	private String empPw;
	@NotBlank
	@Pattern(regexp = "^\\d{1,6}$", message = "우편번호는 최대 6자리 숫자만 입력 가능합니다.")
	private String postCode;
	@NotBlank
	@Email(message = "올바른 이메일 형식이 아닙니다.")
	private String email;
	@NotBlank
	private String address;
	@NotNull
	private Integer depNo;
	@NotBlank
	@Pattern(regexp = "^\\d{11}$", message = "전화번호는 00000000000 형식이어야 합니다.")
	private String phone;
	private String extNum;
	@NotBlank
	private String gender;
	@NotBlank
	@Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2}$", message = "생년월일은 YYYY-MM-DD 형식이어야 합니다.")
	private String birth;
	private String location;
	private String dname;
	private String descript;
	private String fileName;
	private String ext;
	private String connectionStatus;
	
	
}
