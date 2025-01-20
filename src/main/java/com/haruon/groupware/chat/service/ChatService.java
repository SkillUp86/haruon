package com.haruon.groupware.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.chat.dto.EmpDTO;
import com.haruon.groupware.chat.mapper.ChatMapper;

@Service
@Transactional
public class ChatService {
	@Autowired ChatMapper chatMapper;
	
	public List<EmpDTO> getEmpList() {
		return chatMapper.empList();
	}
}
