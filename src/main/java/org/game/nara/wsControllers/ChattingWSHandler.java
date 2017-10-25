package org.game.nara.wsControllers;


import java.io.IOException;
import java.util.*;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("cws")
public class ChattingWSHandler extends TextWebSocketHandler {
	List<WebSocketSession> list = new ArrayList<>();
	Map<String, WebSocketSession> users = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
		Map<String, Object> hs = session.getAttributes();
		String id = (String)hs.get("auth_id");
		users.put(id, session);
	}
	

	public void sendMessageToUser(String receiver, String msg, String sender) throws IOException {
		String json = String.format("{\"receiver\":\"%s\", \"msg\":\"%s\" ,\"sender\":\"%s\"}", receiver,msg,sender);
		if(users.containsKey(receiver)) {
			users.get(receiver).sendMessage(new TextMessage(json));
			users.get(sender).sendMessage(new TextMessage(json));
		}
	}
	
	public String confirmToUser(String chat, String receiver, String sender) throws IOException {
		String rst = "no";
		String json = String.format("{\"receiver\":\"%s\", \"chat\":\"%s\" ,\"sender\":\"%s\"}", receiver,chat,sender);
		if (users.containsKey(receiver)) {
				users.get(receiver).sendMessage(new TextMessage(json));
				rst="yes";
			}
		return rst;
		
	}
	
}
