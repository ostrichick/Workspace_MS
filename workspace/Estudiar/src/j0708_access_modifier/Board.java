package j0708_access_modifier;

//엔티티 클래스
//데이터를 담아 전달할 목적으로 만들어진 클래스
public class Board {
	// 필드의 접근제한자는 모두 private로 제한하여 외부에서 필드에 직접적으로 값을 담지 못하게 차단
	private String title;
	private String content;
	private String writer;
	private String wdate;
	private int hit;

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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	/*
	 * public void setTitle(String title) { // 필드 title을 채우기 전에 데이터를 검증해야한다면 // 이
	 * 위치에서 한뒤 아래에서 필드에 데이터를 채운다 this.title = title; }
	 * 
	 * public void setContent(String content) { this.content = content; }
	 * 
	 * public void setWriter(String writer) { this.writer = writer; }
	 * 
	 * public void setWdate(String wdate) { this.wdate = wdate; }
	 * 
	 * public void setHit(int hit) { this.hit = hit; }
	 * 
	 * public String getTitle() { return title; }
	 * 
	 * public String getContent() { return content; }
	 * 
	 * public String getWriter() { return writer; }
	 * 
	 * public String getWdate() { return wdate; }
	 * 
	 * public int getHit() { return hit; }
	 */
//
	//
//
}
