package ezen.dev.di.annotation_scan;

import org.springframework.stereotype.Service;

@Service("sms")
public class SMSService implements MessageService {
	@Override
	public void sendMsg(String message) {
		System.out.println("SMS: " + message);
	}
}
