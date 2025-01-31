package com.haruon.groupware.chat.service;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.chat.entity.ChatRoom;
import com.haruon.groupware.chat.mapper.ChatMapper;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Transactional
@Slf4j
public class ChatAspect {
	
	@Autowired ChatMapper chatMapper;
	
	// 채팅방 나가기 -> 해당 방에 더이상 참가자가 없다면 해당 방의 채팅내역 삭제
	@Around("execution(* com.haruon.groupware.chat.mapper.ChatMapper.deleteAttendanceFromRoom(..))")
	public void checkParticipantAndDeleteRoom(ProceedingJoinPoint joinPoint) {
		ChatRoom param = (ChatRoom) joinPoint.getArgs()[0];
		log.debug("checkParticipantAndDeleteRoom 받은 파라미터 값 확인 = {}",param.toString());
		
		// 대상 메서드 실행 전 : 대화상대방이 방에 남아있는지 확인(1 = 혼자 있음 / 2 = 상대방 있음)
		int checkParticipant = chatMapper.checkParticipation(param);
		log.debug("참가자수 = {}",checkParticipant);
		
		if(checkParticipant == 0) log.debug("checkParticipation 실행 오류, 결과 = {}", checkParticipant);
		
		// 대상 메서드 확인
		try {
			joinPoint.proceed();
			
			// 대상 메서드 실행 후 : 대화 상대방이 없다면, 모든 대화내역을 DB에서 삭제
			if(checkParticipant == 1) {
				int result1 = chatMapper.deleteChatRoomConversation(param);
				log.debug("채팅방 관련 채팅 및 방 삭제, 대상 대화 건수 = {}", result1);
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
}
