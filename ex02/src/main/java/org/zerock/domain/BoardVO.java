package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	
	private int replyCnt;
	
	// 첨부 파일 목록 -> 개발자마다 견해가 다르다.
	private List<BoardAttachVO> attachList;
}
