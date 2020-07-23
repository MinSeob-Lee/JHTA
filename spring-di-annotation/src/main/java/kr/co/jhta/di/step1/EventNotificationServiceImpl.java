package kr.co.jhta.di.step1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.di.SmsMessageSender;

@Service
public class EventNotificationServiceImpl implements NotificationService {

	@Autowired
	private SmsMessageSender sms;
	
	public void setSms(SmsMessageSender sms) {
		this.sms = sms;
	}
	
	@Override
	public void notice(String dept, String subject, String content) {
		
		sms.send(dept, "모든 고객", subject, content);
	}
}
