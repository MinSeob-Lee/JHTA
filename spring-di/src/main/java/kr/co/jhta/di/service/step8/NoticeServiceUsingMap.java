package kr.co.jhta.di.service.step8;

import java.util.List;
import java.util.Map;

import kr.co.jhta.di.service.MessageSender;
import kr.co.jhta.di.service.step7.UserService;
import kr.co.jhta.di.service.vo.User;

public class NoticeServiceUsingMap implements NoticeService{
 
	private Map<String, MessageSender> messageSenders;
	private UserService userService;
	
	public void setMessageSenders(Map<String, MessageSender> messageSenders) {
		this.messageSenders = messageSenders;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void notice(String dept, String subject, String content) {
		List<User> users = userService.getAllUser();
		
		for (User user : users) {
			// 사용자가 지정한 수신방식을 조회한다
			String receiveType = user.getReceiveType();
			System.out.println("수신방식: " + receiveType );
			
			// 수신방식에 맞는 메세지 발신객체를 Map객체에서 꺼낸다.
			MessageSender sender = messageSenders.get(receiveType);
			System.out.println("메세지 발신객체: " + sender);
			// 획득된 메세지 발신객체를 사용해서 메세지를 발송한다.
			sender.send(dept, user.getName(), subject, content);
			System.out.println();
		}
		
	}
}
