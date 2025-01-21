package com.haruon.groupware.config;

import java.util.HashMap;
import java.util.Objects;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.haruon.groupware.chat.mapper.ChatMapper;
import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpMapper;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
public class WebSocketMessageHandler extends TextWebSocketHandler {

	HashMap<String, WebSocketSession> sessionMap = new HashMap<>();	// <key - empNo, value - WebSocketSession>
	private final ChatMapper chatMapper;
	private final EmpMapper empMapper;
	
	public WebSocketMessageHandler(ChatMapper chatMapper, EmpMapper empMapper) {
		this.chatMapper = chatMapper;
		this.empMapper = empMapper;
	}
	
	// 웹 소켓 연결 설정된 후 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// sessionMap<empId, session> 설정
		String empNo = searchEmpNo(session);
		sessionMap.put(empNo, session);
		
		UriComponents uriComponents = UriComponentsBuilder
									  .fromUriString(Objects.requireNonNull(session.getUri()).toString())
									  .build();
		String id = uriComponents.getQueryParams().getFirst("id");
		if (empMapper.checkEmpNo(id) == 1) {
			// 읽지않은 메세지 호출(cahtMapper.countChatUnread)
		} else {
			session.sendMessage(new TextMessage("존재하지 않는 사용자입니다."));
		}

	}
	
	// 웹 소켓 연결 종료 후 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
	
	// WebSocket session URI parsing 하여 id(empNo)를 알아냄 
	private String searchEmpNo(WebSocketSession session) {
		UriComponents uriComponents = UriComponentsBuilder
										.fromUriString(session.getUri().toString())
										.build();
		return uriComponents.getQueryParams().getFirst("id");
	}
	
	// 특정 사용자에게 websocket 메세지 전송 
	private void sendNotification(String empNo, String msg) throws Exception {
		WebSocketSession session = sessionMap.get(empNo);
		if(session != null && session.isOpen()) {
			session.sendMessage(new TextMessage(msg));
		}
	}
	
}
