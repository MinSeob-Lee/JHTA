package kr.co.jhta.di.service.step8;

import java.util.List;
import java.util.Set;

import kr.co.jhta.di.service.MessageSender;
import kr.co.jhta.di.service.step7.UserService;
import kr.co.jhta.di.service.vo.User;

/**
 * 사용가능한 모든 MassageSender류 객체를 이용해서 공지사항을 전달하는 기능을 제공한다.
 * @author JHTA
 *
 */

public class NoticeServiceUsingSet implements NoticeService{
	
	private Set<MessageSender> messageSenders;
	private UserService userService;
	
	public void setMessageSender(Set<MessageSender> messageSender) {
		this.messageSenders = messageSender;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
		
	@Override
	public void notice(String dept, String subject, String content) {
		List<User> users = userService.getAllUser();
	
		for (MessageSender messageSender : messageSenders) {
			System.out.println("사용중인 MessageSender 구현객체: " + messageSender.getClass().getName());
			for(User user : users) {
				messageSender.send(dept, user.getTel(), subject, content);
				
			}
			
		}
	}
}












