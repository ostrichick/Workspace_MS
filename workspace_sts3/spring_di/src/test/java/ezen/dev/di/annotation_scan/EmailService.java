package ezen.dev.di.annotation_scan;

import org.springframework.stereotype.Service;

@Service("email")
public class EmailService implements MessageService {
	@Override
	public void sendMsg(String message) {
		System.out.println("Email: " + message);
	}
}
