package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Board;

public interface BoardDao {

	void insertBoard(Board board);
	List<Board> selectBoards();
	Board selectBoard(long boardNo);
	void updateBoard(Board board);
}
