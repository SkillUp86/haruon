package com.haruon.groupware.common.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
public class ResponseDTO<T> {
	private final String message; // 메세지
	private final String status; // 상태 코드
	private final T data; // Json 데이터로 반환할 값
}
