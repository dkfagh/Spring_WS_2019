package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.PboardVO;
import org.zerock.domain.Criteria;

public interface PboardMapper {

	// 목록
	public List<PboardVO> getList();
	
	public List<PboardVO> getListWithPaging(Criteria cri);
	
	// 등록
	public void insert(PboardVO board);
	
	// 등록2
	public void insertSelectKey(PboardVO board);
	
	// 상세보기
	public PboardVO read(Long bno);
	
	// 삭제
	public int delete(Long bno);
	
	// 수정
	public int update(PboardVO board);
	
	// 전체 데이터 개수
	public int getTotalCount(Criteria cri);
	
	// 비밀번호 확인
	public PboardVO check(String password);
}
