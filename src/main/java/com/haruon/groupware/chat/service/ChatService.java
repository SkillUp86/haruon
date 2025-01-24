package com.haruon.groupware.chat.service;

import static com.haruon.groupware.chat.entity.ChatRoom.createRoomId;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.chat.dto.ChatRoomDTO;
import com.haruon.groupware.chat.dto.CheckRoomDTO;
import com.haruon.groupware.chat.entity.ChatRoom;
import com.haruon.groupware.chat.mapper.ChatMapper;
import com.haruon.groupware.user.dto.EmpListDTO;
import com.haruon.groupware.user.mapper.EmpUpdateMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
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
	
	// 채팅방 생성 
	public String createChatRoom(Integer empNo1, Integer empNo2) {
		ChatRoom room = createRoomId();
		room.setEmpNo(empNo1);
		chatMapper.insertRoomJoin(room);
		
		room.setEmpNo(empNo2);
		chatMapper.insertRoomJoin(room);
		
		return room.getRoomId();
	}
	
	// 채팅방 검색 
	public String findChatRoom(String roomId) {
		return chatMapper.findChatRoom(roomId);
	}
	
	// 특정 채팅방의 채팅 상대방 이름/사진/연결상태 
	public ChatRoomDTO getOtherParticipant(ChatRoom chatRoom) {
		return chatMapper.getOtherParticipant(chatRoom);
	}
	
	// 특정 채팅방의 이전 대화 내역
	public List<ChatRoomDTO> getChatConversation(String roomId) {
		return chatMapper.getChatConversation(roomId);
	}
	
	// 채팅방이 없으면 채팅방 생성하기 
	public String findOrCreateChatRoom(Integer empNo1, Integer empNo2) {
		CheckRoomDTO checkRoomDTO = new CheckRoomDTO();
		checkRoomDTO.setAttendacne1(empNo1);
		checkRoomDTO.setAttendacne2(empNo2);
		
		// 참가자로 채팅방 유무 확인 
		String checkRoomId = chatMapper.findChatRoomExist(checkRoomDTO);
		
		if(checkRoomId == null) {
			ChatRoom room = createRoomId();
			
			room.setEmpNo(empNo1);
			chatMapper.insertRoomJoin(room);
			
			room.setEmpNo(empNo2);
			chatMapper.insertRoomJoin(room);
			
			checkRoomId = chatMapper.findChatRoomExist(checkRoomDTO);
			log.debug("채팅방 없음 - 방 생성 : {}", checkRoomId);
		} else {
			log.debug("채팅방 있음 - 방 조회 : {}", checkRoomId);
		}
		
		return checkRoomId;
	}
	
	// 특정 채팅방 나가기 
	public void deleteAttendanceFromRoom(ChatRoom deleteTarget) {
		chatMapper.deleteAttendanceFromRoom(deleteTarget);
	}
}
