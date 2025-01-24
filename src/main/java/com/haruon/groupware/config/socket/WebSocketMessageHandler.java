package com.haruon.groupware.config.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.haruon.groupware.chat.entity.Chat;
import com.haruon.groupware.chat.mapper.ChatMapper;
import com.haruon.groupware.user.mapper.EmpMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
public class WebSocketMessageHandler extends TextWebSocketHandler {
	
	private final ChatMapper chatMapper;
	
	public WebSocketMessageHandler(ChatMapper chatMapper, EmpMapper empMapper) {
		this.chatMapper = chatMapper;
	}
	
	// 페이로드 전송을 위한 List
	List<WebSocketSession> sessionList = new ArrayList<>();		
	
	// 룸ID 별 접속 핸들링을 위한 Map
	Map<String, WebSocketSession> roomSessionMap = new HashMap<>();

	// 웹 소켓 연결 설정된 후 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.info("{} - 클라이언트 접속", session.toString());
		//log.debug("쿼리파라미터(roomId) 결과 = {}", searchRoomNo(session));
		// sessionMap<roomId, session> 설정
		String roomId = searchRoomNo(session);
		log.debug("roomId = {}",roomId);

		
		sessionList.add(session);
		roomSessionMap.put(roomId, session);
		
		UriComponents uriComponents = UriComponentsBuilder
									  .fromUriString(Objects.requireNonNull(session.getUri()).toString())
									  .build();
		String id = uriComponents.getQueryParams().getFirst("id");
		
		if (chatMapper.findChatRoom(roomId) != null) {
			// 읽지않은 메세지 호출(cahtMapper.countChatUnread) : 시간 될때ㅐ 반영, roomId에 매칭되는 '안읽음' 메세지 건수 출력
		} else {
			session.sendMessage(new TextMessage("error"));
		}

	}
	
	// 웹 소켓 연결 종료 후 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("{} - 클라이언트 연결 해제", session.toString());
		String roomId = searchRoomNo(session);
		roomSessionMap.remove(roomId);
		sessionList.remove(session);
	}
	
	// WebSocket session URI parsing 하여 id(roomId)를 알아냄 
	// roomId가 null이 반환됨. 메서드 수정 필요 
	private String searchRoomNo(WebSocketSession session) {
		UriComponents uriComponents = UriComponentsBuilder
										.fromUriString(session.getUri().toString())
										.build();
		return uriComponents.getQueryParams().getFirst("id");
	}
	
	// 메세지 전송 핸들러 
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// "messageBox = roomId[0] senderNo[1] sendTime[2] message[3] "
		String[] messageBox = message.getPayload().toString().split("~");
		
		for(String m : messageBox) {
			log.debug("messageBox = {}",m);
		}
		String payload = messageBox[2] + "~" + messageBox[3];
		log.info(" 서버 => 클라이언트 메세지 - {}", payload);
		log.debug("페이로드를 담을 세션 유무 확인", sessionList.size());
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload().toString()));
			log.debug("클라이언트로 보내는 값 = {}", new TextMessage(message.getPayload().toString()));
		}
		
		// addChat
		Chat chat = new Chat();
		chat.setRoomId(messageBox[0]);
		chat.setSenderNo(Integer.parseInt(messageBox[1]));
		chat.setSendTime(messageBox[2]);
		chat.setMessage(messageBox[3]);
		chatMapper.insertChat(chat);
	}
	
}
