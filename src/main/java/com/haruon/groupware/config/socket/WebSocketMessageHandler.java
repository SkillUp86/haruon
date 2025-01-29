package com.haruon.groupware.config.socket;

import java.util.ArrayList;
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
        log.info("{} - 클라이언트 접속, {} - 접속된 room Number", session.toString(), roomId);
        // 페이로드 전송을 위한 List
        List<WebSocketSession> sessionList = new ArrayList<>();

        sessionList.add(session);
        roomSessionMap.put(roomId, sessionList);

        if (chatMapper.findChatRoom(roomId) == null) {
        	session.sendMessage(new TextMessage("error"));
        }
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


        String payload = messageBox[2] + "~" + messageBox[3];
        // log.info(" 서버 => 클라이언트 메세지 - {}", payload);
        // log.debug("페이로드를 담을 세션 유무 확인", roomSessionMap.get(messageBox[0]).size());
        
        // roomId에 매칭되는 세션서버에 메세지 전송
        for(WebSocketSession sess : roomSessionMap.get(messageBox[0])) {
            sess.sendMessage(new TextMessage(message.getPayload().toString()));
            log.debug("클라이언트로 보내는 값 = {}", new TextMessage(message.getPayload().toString()));
        }

        // 페이로드 데이터를 DB로 이동 (addChat)
        Chat chat = new Chat();
        chat.setRoomId(messageBox[0]);
        chat.setSenderNo(Integer.parseInt(messageBox[1]));
        chat.setSendTime(messageBox[2]);
        chat.setMessage(messageBox[3]);
        chatMapper.insertChat(chat);
    }
}
