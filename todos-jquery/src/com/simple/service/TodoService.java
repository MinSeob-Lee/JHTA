package com.simple.service;

import java.util.List;

import com.simple.dao.TodoDao;
import com.simple.vo.Todo;

public class TodoService {

	private TodoDao todoDao = new TodoDao();
	
	/**
	 * 새로운 일정정보를 추가한다.
	 * 일정번호는 시퀀스번호를 획득해서 저장한 다음  DAO에 전달한다.
	 * @param todo 새 일정정보
	 * @return 시퀀스번호와 등록일이 포함된 일정정보
	 * @throws Exception
	 */
	public Todo addNewTodo(Todo todo) throws Exception {
		int sequence = todoDao.getTodoSequence();
		todo.setNo(sequence);
		todoDao.insertTodo(todo);
		
		return todo;
	}
	
	/**
	 * 지정된 사용자가 등록한 일정정보들을 반환한다.
	 * @param userId 로그인된 사용자의 아이디
	 * @return 지정된 사용자가 저장한 모든 일정
	 * @throws Exception
	 */
	public List<Todo> getMyTodos(String userId) throws Exception {
		return todoDao.getTodosByUserId(userId);
	}
	
	/**
	 * 지정된 일정번호에 해당하는 일정 상세정보를 반환한다.
	 * @param todoNo 조회할 일정번호
	 * @return 일정 상세정보
	 * @throws Exception
	 */
	public Todo getTodoDetail(int todoNo) throws Exception {
		return todoDao.getTodoByNo(todoNo);
	}
	
	/**
	 * 변경된 일정정보를 저장시킨다.
	 * @param todo 변경된 일정정보
	 * @return 변경된 일정정보
	 * @throws Exception
	 */
	public Todo updateTodo(Todo todo) throws Exception  {
		Todo savedTodo = todoDao.getTodoByNo(todo.getNo());
		
		savedTodo.setTitle(todo.getTitle());
		savedTodo.setContent(todo.getContent());
		savedTodo.setDay(todo.getDay());
		savedTodo.setCompletedDay(todo.getCompletedDay());
		savedTodo.setStatus(todo.getStatus());
		
		todoDao.updateTodo(savedTodo);
		
		return savedTodo;
	}
}
