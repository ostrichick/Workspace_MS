package ezen.dev.di.annotation_scan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("constructor")
public class ConstructorDI {
	private MessageService messageService;

	@Autowired(required = false)
	public ConstructorDI(@Qualifier("katalk") MessageService messageService) {
		this.messageService = messageService; // 카톡만 주입받겠다는 표시
	}

	@Autowired(required = false)
	public void processMsg(String message) {
		messageService.sendMsg(message);
	}
}
