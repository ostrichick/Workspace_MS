package ezen.dev.di.annotation_scan;

import org.springframework.stereotype.Service;

@Service("katalk")
public class KatalkService implements MessageService {
	@Override
	public void sendMsg(String message) {
		System.out.println("KakaoTalk: " + message);
	}
}
