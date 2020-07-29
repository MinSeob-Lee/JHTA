package kr.co.jhta.dao;


import org.apache.ibatis.session.SqlSession;

import kr.co.jhta.util.MybatisUtil;
import kr.co.jhta.vo.User;

public class UserDao {

	public User getUserById(String userId) {
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			User user = session.selectOne("getUserById", userId);
			return user;
		} finally {
			session.close();
		}
	}
}
