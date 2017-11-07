package org.game.nara.wsControllers;


import java.io.IOException;
import java.util.*;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("nws")
public class NoteWSHandler extends TextWebSocketHandler {
	Map<String, WebSocketSession> users = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> hs = session.getAttributes();
		String id = (String)hs.get("auth_id");
		users.put(id, session);
	}
	
	public void sendMessageToUser(String id, String msg) {
		if(users.containsKey(id)) {
			try {
				users.get(id).sendMessage(new TextMessage(msg));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> hs = session.getAttributes();
		String id = (String)hs.get("auth_id");
		users.remove(id);
	}
}
