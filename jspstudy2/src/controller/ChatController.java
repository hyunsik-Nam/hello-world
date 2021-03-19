package controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatting")
public class ChatController {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage //client에서 메세지 수신시
	public void onMessage(String message, Session session)
		throws IOException{
		synchronized (clients) {
			for(Session client : clients) {
				if(!client.equals(session)) {//메세지를 전송한 클라이언트 제외
					//서버가 클라이언트로 메세지 전송. 브로드캐스팅
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	@OnOpen // client 접속시
	public void onOpen(Session session) {
		clients.add(session); //set에 접속 추가
	}
	@OnClose //client 접속 종료시
	public void onClose(Session session) {
		clients.remove(session);
	}
	
}
