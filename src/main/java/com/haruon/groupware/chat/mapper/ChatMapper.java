package com.haruon.groupware.chat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.user.dto.EmpListDTO;

@Mapper
public interface ChatMapper {
	List<EmpListDTO> empList();
}
