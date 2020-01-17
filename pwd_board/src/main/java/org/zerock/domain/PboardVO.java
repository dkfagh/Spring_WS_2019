package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PboardVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String password;
	private Date regdate;
	private Date updateDate;
}
