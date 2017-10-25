package org.game.nara.wsControllers;


import java.io.IOException;
import java.util.*;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("cws")
public class ChattingWSHandler extends TextWebSocketHandler {
	Map<String, WebSocketSession> users = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> hs = session.getAttributes();
		String id = (String)hs.get("auth_id");
		users.put(id, session);
		
	}
	
	public void sendMessageToUser(String id, String msg, String au) throws IOException {
		String json = String.format("{\"receiver\":\"%s\", \"msg\":\"%s\" ,\"sender\":\"%s\"}", id,msg,au);
		if(users.containsKey(id)) {
			users.get(id).sendMessage(new TextMessage(json));
		}
		
	}
	
	public void confirmToUser(String chat, String id) throws IOException {
		String json = String.format("{\"id\":\"%s\", \"chat\":\"%s\"}", id,chat);
		users.get(id).sendMessage(new TextMessage(json));
	}
	
}
