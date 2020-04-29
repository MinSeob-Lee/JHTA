package com.sample.school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.sample.school.util.ConnectionUtil;
import com.sample.school.vo.Subject;

public class SubjectDAO {

	public void addSubject(Subject subject) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		//PreparedStatement pstmt = connection.prepareStatement(sql);
		
	}
	
	public Subject getSubjectByNo(int subjectNo) {
		return null;
	}
}
