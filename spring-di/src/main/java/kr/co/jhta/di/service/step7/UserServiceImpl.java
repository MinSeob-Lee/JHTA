package kr.co.jhta.di.service.step7;

import java.util.ArrayList;
import java.util.List;

import kr.co.jhta.di.service.vo.User;

public class UserServiceImpl implements UserService {

	@Override
	public List<User> getAllUser() {
		List<User> users = new ArrayList<>();
		User user1 = new User("1", "홍길동", "010-0000-0000", "sms");
		User user2 = new User("2", "김유신", "010-1111-1111", "sms");
		User user3 = new User("3", "강감찬", "010-2222-2222", "sms");
		
		users.add(user1);
		users.add(user2);
		users.add(user3);
		
		return users;
	}
}
