package com.haruon.groupware.chat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.chat.dto.EmpDTO;

@Mapper
public interface ChatMapper {
	List<EmpDTO> empList();
}
