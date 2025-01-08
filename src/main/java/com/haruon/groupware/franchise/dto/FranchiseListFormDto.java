package com.haruon.groupware.franchise.dto;

import lombok.Data;

@Data
public class FranchiseListFormDto {
	private Integer fraNo; // 가맹점 번호
	private String fname; // 가맹점 이름
	private String address; // 주소
	private String id; // 사업자번호 10자리
	private String leader; // 사장 이름
	private String phone; // 휴대폰
	private String email; // 이메일
	private String openYn; // 오픈, 클로즈
	private String createDate; // 생성일자
	private String updateDate; // 수정일자
}
