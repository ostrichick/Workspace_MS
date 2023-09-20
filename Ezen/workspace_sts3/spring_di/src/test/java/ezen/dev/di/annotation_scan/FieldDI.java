package ezen.dev.di.annotation_scan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("field")
public class FieldDI { // 비권장

	@Autowired(required = false)
	@Qualifier("sms")
	private MessageService messageService;

	public void processMsg(String message) {
		messageService.sendMsg(message);
	}
}
