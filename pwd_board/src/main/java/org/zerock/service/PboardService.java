package org.zerock.service;

import java.util.List;

import org.zerock.domain.PboardVO;
import org.zerock.domain.Criteria;

public interface PboardService {

	// 등록
	public void register(PboardVO board);
	
	// 상세보기, 수정화면
	public PboardVO get(Long bno);
	
	// 수정
	public boolean modify(PboardVO board);
	
	// 삭제
	public boolean remove(Long bno);
	
	// 목록
	//public List<BoardVO> getList();
	public List<PboardVO> getList(Criteria cri);
	
	// 추가
	public int getTotal(Criteria cri);
	
	// 비밀번호 확인
	public PboardVO check(String password);
}
