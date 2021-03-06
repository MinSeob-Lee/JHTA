package com.simple.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.simple.dao.TodoDao;
import com.simple.dto.TodoDto;

import kr.co.jhta.util.pagination.Pagination;

public class TodoService {

	private TodoDao todoDao = TodoDao.getInstance();
	
	public List<TodoDto> getRecentTodos() throws Exception {
		List<TodoDto> todos = todoDao.getRecentTodos();
		return todos;
	}
	
	public TodoDto getTodoDetail(int todoNo) throws Exception {
		TodoDto todo = todoDao.getTodoByNo(todoNo);
		return todo;
	}
	
	public TodoDto updateTodoStatus(int todoNo, String status) throws Exception {
		TodoDto todo = todoDao.getTodoByNo(todoNo);
		
		todo.setStatus(status);
		
		if ("처리완료".equals(status)) {
			todo.setCompletedDay(new Date());
		} else {
			todo.setCompletedDay(null);
		}
		
		todoDao.updateTodo(todo);
		
		return todo;
	}

	public Map<String, Object> getTodoList(String userId, int pageNo, int rows, String status, String keyword) throws Exception {
		// 일정 갯수 조회하기
		int totalRows = todoDao.getTotalRows(userId, status, keyword);
		// 페이지 내비게이션에 필요한 정보 생성하기
		// 현재 페이지 번호, 화면에 표시할 행의 갯수, 전체 데이터의 갯수가 필요함.
		Pagination pagination = new Pagination(pageNo, rows, totalRows);
		// 현재 페이지번호에 해당하는 데이터 조회에 필요한 구간 계산하기
		int beginIndex = (pageNo - 1)*rows + 1;
		int endIndex = pageNo*rows;
		
		// 조회조건을 만족하는 일정 조회하기
		List<TodoDto> todos = todoDao.getTodos(userId, status, keyword, beginIndex, endIndex);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("todos", todos);
		map.put("pagination", pagination);
		
		return map;
	}
}
