package kr.co.jhta.di.step2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		String conf = "classpath:/spring/context-step2.xml";
		ApplicationContext ctx = new GenericXmlApplicationContext(conf);
		AlarmServiceImpl alarmServiceImpl = ctx.getBean(AlarmServiceImpl.class);
		
		alarmServiceImpl.alarm("코로나 바이러스 예방을 위한 마스크 쓰기에 실천해주십시오.");
	}
}
