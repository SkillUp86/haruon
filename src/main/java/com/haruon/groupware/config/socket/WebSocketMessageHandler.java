package com.haruon.groupware.config.socket;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.haruon.groupware.chat.entity.Chat;
import com.haruon.groupware.chat.mapper.ChatMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class WebSocketMessageHandler extends TextWebSocketHandler {

    private final ChatMapper chatMapper;

    public WebSocketMessageHandler(ChatMapper chatMapper) {
        this.chatMapper = chatMapper;
    }

    // 룸ID 별 접속 핸들링을 위한 Map 여러 클라이언트 연결처리시 동시 접근 안정성을 위해 concurrentHashMap 사용
    Map<String, List<WebSocketSession>> roomSessionMap = new ConcurrentHashMap<>();

    // 웹 소켓 연결 설정된 후 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // sessionMap<roomId, session> 설정
        String roomId = (String) session.getAttributes().get("roomId");
        // 비정상적인 채팅방 접근이라면 error 메세지 전달
        if (chatMapper.findChatRoom(roomId) == null) {
        	session.sendMessage(new TextMessage("error"));
        	return;
        }
        
        log.info("{} - 클라이언트 접속, {} - 접속된 room Number", session.toString(), roomId);
        
        // roomSessionMap에 roomId 키가 없다면 ArrayList 인스턴스를 생성한 뒤 session을 담기
        roomSessionMap.computeIfAbsent(roomId, key -> new ArrayList<WebSocketSession>())
        			  .add(session);
    }

    // 웹 소켓 연결 종료 후 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String roomId = (String) session.getAttributes().get("roomId");
        log.info("{} - 클라이언트 연결 해제, {} - 해제된 Number ", session.toString(), roomId);
        roomSessionMap.get(roomId).remove(session);
    }

    // 메세지 전송 핸들러
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // "messageBox = roomId[0] senderNo[1] sendTime[2] message[3] "
        String[] messageBox = message.getPayload().toString().split("~");

        // log.info(" 서버 => 클라이언트 메세지 - {}", payload);
        // log.debug("페이로드를 담을 세션 유무 확인", roomSessionMap.get(messageBox[0]).size());
        
        List<WebSocketSession> sessions = roomSessionMap.get(messageBox[0]);
        
        // 메세지를 클라이언트로 전달
        if (sessions != null) {
            Iterator<WebSocketSession> iterator = sessions.iterator();
            while (iterator.hasNext()) {
                WebSocketSession sess = iterator.next();
                if (sess.isOpen()) {
                    sess.sendMessage(new TextMessage(message.getPayload().toString()));
                    log.debug("클라이언트로 보내는 값 = {}", new TextMessage(message.getPayload().toString()));
                } else {
                    iterator.remove();
                }
            }
        }

        // 데이터를 DB로 이동 (addChat)
        Chat chat = new Chat();
        chat.setRoomId(messageBox[0]);
        chat.setSenderNo(Integer.parseInt(messageBox[1]));
        chat.setSendTime(messageBox[2]);
        chat.setMessage(messageBox[3]);
        chatMapper.insertChat(chat);
    }
}
