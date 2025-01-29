package com.haruon.groupware.config.socket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.HandshakeInterceptor;

@EnableWebSocket
@Configuration
public class WebSocketConfig implements WebSocketConfigurer {
	
	private final WebSocketMessageHandler webSocketMessageHandlers;
	
	public WebSocketConfig(WebSocketMessageHandler webSocketMessageHandlers) {
		this.webSocketMessageHandlers = webSocketMessageHandlers;
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(webSocketMessageHandlers, "ws/chat/**")
				.addInterceptors(handshakeInterceptor())
				.setAllowedOrigins("*");
	}
	
	@Bean
	public HandshakeInterceptor handshakeInterceptor() {
	    return new ChattingHandShakeInterceptor();
	}
	
}
