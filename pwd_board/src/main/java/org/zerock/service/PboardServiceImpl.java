package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.PboardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.PboardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PboardServiceImpl implements PboardService {
	
	// spring 4.3 이상에서 자동 주입
	private PboardMapper mapper;

	@Override
	public void register(PboardVO board) {

		log.info("register......" + board);
		
		mapper.insertSelectKey(board);
	}

	@Override
	public PboardVO get(Long bno) {

		log.info("get......" + bno);

		return mapper.read(bno);
	}

	@Override
	public boolean modify(PboardVO board) {
		
		log.info("modify......" + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {

		log.info("remove......" + bno);
		
		return mapper.delete(bno) == 1;
	}

//	@Override
//	public List<BoardVO> getList() {
//
//		log.info("getList........");
//		
//		return mapper.getList();
//	}
	
	@Override
	public List<PboardVO> getList(Criteria cri) {

		log.info("get List with criteria : " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public PboardVO check(String password) {

		log.info("check password");
		return mapper.check(password);
	}

}
