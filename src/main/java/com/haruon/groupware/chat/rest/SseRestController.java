package com.haruon.groupware.chat.rest;


import java.io.IOException;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.haruon.groupware.chat.service.SseEmitters;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class SseRestController {
	
	private final SseEmitters sseEmitters;
	
	public SseRestController(SseEmitters sseEmitters) {
		this.sseEmitters = sseEmitters;
	}


	@GetMapping(value = "/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public ResponseEntity<SseEmitter> connect() {
		SseEmitter emitter = new SseEmitter(60 * 1000L);
		sseEmitters.createEmitter(emitter);
		
		try {
			emitter.send(SseEmitter.event()
				   .name("connect")
				   .data("connected"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		return ResponseEntity.ok(emitter);
		
	}

}
