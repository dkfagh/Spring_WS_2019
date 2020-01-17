package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	// 목록
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	// 등록
	public void insert(BoardVO board);
	
	// 등록2
	public void insertSelectKey(BoardVO board);
	
	// 상세보기
	public BoardVO read(Long bno);
	
	// 삭제
	public int delete(Long bno);
	
	// 수정
	public int update(BoardVO board);
	
	// 전체 데이터 개수
	public int getTotalCount(Criteria cri);
	
	// 댓글 개수
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}
