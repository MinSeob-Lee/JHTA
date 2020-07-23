package kr.co.jhta.di.step1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import kr.co.jhta.di.SmsMessageSender;
import kr.co.jhta.di.MessageSender;

public class Main {

	public static void main(String[] args) {
		String conf = "classpath:/spring/context-step1.xml";
		ApplicationContext ctx = new GenericXmlApplicationContext(conf);
		MessageSender sender = ctx.getBean(SmsMessageSender.class);
		EventNotificationServiceImpl ens = ctx.getBean(EventNotificationServiceImpl.class);
		System.out.println(sender);
		sender.send("홍보부", "홍길동", "제목", "내용");
		ens.notice("홍보부", "폐업안내", "전품목 대방출로 폐업합니다.");
	}
}
