package com.demo.spring.websocket.handler;

import com.demo.spring.websocket.config.WebSocketConfig;
import org.apache.log4j.Logger;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;

/**
 * Created by Admin on 22-Aug-14.
 */
public class MyHandler extends TextWebSocketHandler {
    private final static Logger log = Logger.getLogger(WebSocketConfig.class);

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) {
        log.info("handle message: " + message.toString());
        try {
            session.sendMessage(new TextMessage(message.getPayload()));
        } catch (IOException e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }
    }

}
