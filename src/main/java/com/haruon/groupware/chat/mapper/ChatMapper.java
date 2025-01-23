package com.haruon.groupware.chat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.chat.dto.ChatRoomDTO;
import com.haruon.groupware.chat.entity.ChatRoom;
import com.haruon.groupware.user.dto.EmpListDTO;

@Mapper
public interface ChatMapper {
	List<EmpListDTO> empList();
	Integer countChatUnread();
	
	// 채팅방 생성
	Integer insertRoomJoin(ChatRoom chatRoom);
	
	// 로그인한 사원이 참여하고 있는 채팅방 정보 호출 
	List<ChatRoomDTO> getChatRoomsInfoByEmp(Integer empNo);
	
	// 채팅방 찾기 
	String findChatRoom(String roomId);
	
	// 특정 Room의 채팅 상대방의 이름, 사진(확장자), 연결상태 
	ChatRoomDTO getOtherParticipant(ChatRoom chatRoom);
	
	// 특정 room의 이전 대화 내역 
	List<ChatRoomDTO> getChatConversation(String roomId);
	
	
}
