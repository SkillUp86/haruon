package com.haruon.groupware.config.socket;

import java.util.Map;
import java.util.Objects;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


public class ChattingHandShakeInterceptor implements HandshakeInterceptor {
	// https://innu3368.tistory.com/214
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response
									, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
		
		UriComponents uriComponents = UriComponentsBuilder
				  .fromUriString(Objects.requireNonNull(request.getURI()).toString())
				  .build();
		String id = uriComponents.getQueryParams().getFirst("id");
		
		String path = request.getURI().getPath();
        String roomId = uriComponents.getQueryParams().getFirst("id");
        attributes.put("roomId", roomId);
        return true;
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		// TODO Auto-generated method stub
		
	}
	
	

}
