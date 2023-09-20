package ezen.maru.pjt.vo;

import java.util.Date;

public class BoardVo {
	private int idx;
//private String content; 
	private Date wdate;
	private String isanswered;
	private int parent_idx;
	private String file_original;
	private String file_system;
	private String file_extension;
	private int hit;

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getIsanswered() {
		return isanswered;
	}

	public void setIsanswered(String isanswered) {
		this.isanswered = isanswered;
	}

	public int getParent_idx() {
		return parent_idx;
	}

	public void setParent_idx(int parent_idx) {
		this.parent_idx = parent_idx;
	}

	public String getFile_original() {
		return file_original;
	}

	public void setFile_original(String file_original) {
		this.file_original = file_original;
	}

	public String getFile_system() {
		return file_system;
	}

	public void setFile_system(String file_system) {
		this.file_system = file_system;
	}

	public String getFile_extension() {
		return file_extension;
	}

	public void setFile_extension(String file_extension) {
		this.file_extension = file_extension;
	}

//////////////
// MARU end // 주석 아래부분 참고하여 작성 후 아래 부분은 삭제
//////////////

	private int board_idx;
	private String writer;
	private String title;
	private String content;
	private int price;
	private String address;
	private Date reg_date;
	private String origin_filename1;
	private String origin_filename2;
	private String origin_filename3;
	private String system_filename1;
	private String system_filename2;
	private String system_filename3;
	private int member_idx;

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getOrigin_filename1() {
		return origin_filename1;
	}

	public void setOrigin_filename1(String origin_filename1) {
		this.origin_filename1 = origin_filename1;
	}

	public String getOrigin_filename2() {
		return origin_filename2;
	}

	public void setOrigin_filename2(String origin_filename2) {
		this.origin_filename2 = origin_filename2;
	}

	public String getOrigin_filename3() {
		return origin_filename3;
	}

	public void setOrigin_filename3(String origin_filename3) {
		this.origin_filename3 = origin_filename3;
	}

	public String getSystem_filename1() {
		return system_filename1;
	}

	public void setSystem_filename1(String system_filename1) {
		this.system_filename1 = system_filename1;
	}

	public String getSystem_filename2() {
		return system_filename2;
	}

	public void setSystem_filename2(String system_filename2) {
		this.system_filename2 = system_filename2;
	}

	public String getSystem_filename3() {
		return system_filename3;
	}

	public void setSystem_filename3(String system_filename3) {
		this.system_filename3 = system_filename3;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

}
