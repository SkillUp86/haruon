package com.haruon.groupware.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.chat.dto.ChatRoomDTO;
import com.haruon.groupware.chat.mapper.ChatMapper;
import com.haruon.groupware.user.dto.EmpListDTO;
import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpUpdateMapper;

@Service
@Transactional
public class ChatService {
	@Autowired ChatMapper chatMapper;
	@Autowired EmpUpdateMapper empUpdateMapper;
	
	// 메신저 메인화면에 필요한 정보 호출
	public List<EmpListDTO> getEmpList() {
		return chatMapper.empList();
	}
	
	// 로그인한 사원이 참여하고 있는 채팅방 정보 호출 
	public List<ChatRoomDTO> getChatRoomsInfoByEmp(Integer empNo) {
		return chatMapper.getChatRoomsInfoByEmp(empNo);
	}
	
	
	

}
