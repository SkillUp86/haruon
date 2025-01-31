package com.haruon.groupware.chat.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.auth.CustomUserDetails;
import com.haruon.groupware.chat.dto.ChatRoomDTO;
import com.haruon.groupware.chat.entity.ChatRoom;
import com.haruon.groupware.chat.service.ChatService;
import com.haruon.groupware.user.dto.EmpDto;
import com.haruon.groupware.user.service.EmpService;
import com.haruon.groupware.user.service.EmpUpdateService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
@RequestMapping("/chat")
public class ChatRestController {
	@Autowired private EmpService empService;
	@Autowired private ChatService chatService;
	@Autowired private EmpUpdateService empUpdateService;
	
	// 모든 사원 조회
	@GetMapping("/employees")
	public ResponseEntity<List<EmpDto>> getEmpList() {
		List<EmpDto> empList = empService.getEmpList();
		return ResponseEntity.ok(empList);
	}
	
	// 접속한 사람의 모든 채팅방 목록 반환 
	@GetMapping("/rooms/{empNo}")
	public ResponseEntity<List<ChatRoomDTO>> getRoomsByEmpNo(@PathVariable Integer empNo) {
		List<ChatRoomDTO> chatRoomsList = chatService.getChatRoomsInfoByEmp(empNo);
		return ResponseEntity.ok(chatRoomsList);
	}
	
	// 채팅방 생성 -> 해당 채팅방 ID 반환 
	@PostMapping("/room")
	@ResponseBody
	public String createRoom(@RequestParam Integer emp1
								, @RequestParam Integer emp2) {
		return chatService.createChatRoom(emp1, emp2);
	}
	
	// 특정 채팅방 입장 
	@GetMapping("/room/{roomId}")
	@ResponseBody
	public String enterChatRoom(@PathVariable String roomId) {
		return chatService.findChatRoom(roomId);
	}
	
	// 사원이 참여하고있는 특정 채팅방 나가기
	@PostMapping("/room/{roomId}/particiant/delete")
	public void roomDelete(Authentication auth, @PathVariable String roomId) {
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		ChatRoom deleteTarget = new ChatRoom();
		deleteTarget.setEmpNo(userDetails.getEmpNo());
		deleteTarget.setRoomId(roomId);
		chatService.deleteAttendanceFromRoom(deleteTarget);
	}
	
	
	// 특정 채팅방의 채팅 상대방 정보 
	@GetMapping("/room/{roomId}/particiant")
	public ResponseEntity<ChatRoomDTO> roomParticiant(Authentication auth, @PathVariable String roomId) {
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		ChatRoom roomInfo = new ChatRoom();
		roomInfo.setRoomId(roomId);
		roomInfo.setEmpNo(userDetails.getEmpNo());
		ChatRoomDTO particiant = chatService.getOtherParticipant(roomInfo);
		
		return ResponseEntity.ok(particiant);
	}
	
	// 특정 채팅방의 이전 대화내역
	@GetMapping("/room/{roomId}/conversation")
	public ResponseEntity<List<ChatRoomDTO>> roomConversation(@PathVariable String roomId) {
		List<ChatRoomDTO> conversationList = chatService.getChatConversation(roomId);
		
		return ResponseEntity.ok(conversationList);
	}
	
	// 사원이 직접 상태 변경
	@GetMapping("/connection/update/{status}")
	public void connectionUpdate(Authentication auth, @PathVariable String status) {
		CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
		empUpdateService.changeConnectionInfo(userDetails.getEmpNo(), status);
		log.debug("로그인상태 변경 - {}", status);
	}
}
