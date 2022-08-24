package ezen.dev.spring.vo;

import java.util.Date;

public class BoardVo extends MemberVo {
	private int board_idx;
	private String board_title;
	private String board_content;
	private String board_addr;
	private int board_price;
	private String writer_id;
	private Date reg_date;

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getBoard_price() {
		return board_price;
	}

	public void setBoard_price(int board_price) {
		this.board_price = board_price;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_addr() {
		return board_addr;
	}

	public void setBoard_addr(String board_addr) {
		this.board_addr = board_addr;
	}
}
