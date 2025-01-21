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
	
	Integer createRoom(ChatRoom chatRoom);
	
	// 로그인한 사원이 참여하고 있는 채팅방 정보 호출 
	List<ChatRoomDTO> getChatRoomsInfoByEmp(Integer empNo);
}
