package com.haruon.groupware.chat.service;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SseEmitters {
	private final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	
	public SseEmitter createEmitter(SseEmitter emitter) {
		this.emitters.add(emitter);
		
		log.info("new emitter added: {}", emitter);  
        log.info("emitter list size: {}", emitters.size());  
		
		// 타임아웃/에러 발생 시 기존 emitter 삭제
		emitter.onCompletion(() -> {
			log.info("onCompletion callback");  
			this.emitters.remove(emitter);
		});
		
		emitter.onTimeout(() -> {
		    log.info("onTimeout callback"); 
			emitter.complete();
		});
		emitter.onError(e -> emitters.remove(emitter));
		
		return emitter;
	}
	
	
}
