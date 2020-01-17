package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {

	// 등록
	public void register(BoardVO board);
	
	// 상세보기, 수정화면
	public BoardVO get(Long bno);
	
	// 수정
	public boolean modify(BoardVO board);
	
	// 삭제
	public boolean remove(Long bno);
	
	// 목록
	//public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	
	// 추가
	public int getTotal(Criteria cri);
	
	// 첨부 파일 목록
	public List<BoardAttachVO> getAttachList(Long bno);
}
