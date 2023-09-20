package ezen.dev.di.annotation_scan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
@Component("setter")
public class SetterDI {
	private MessageService messageService;

	@Autowired(required = false)
	@Qualifier("email")
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public void processMsg(String message) {
		messageService.sendMsg(message);
	}
}
