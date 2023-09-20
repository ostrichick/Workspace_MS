package model1pjt.util;

public class PagingUtil {
	private int nowPage; // 현재 페이지 번호
	private int startPage; // 시작 페이지 번호
	private int endPage; // 마지막 페이지 번호
	private int total; // 총 게시글 갯수
	private int perPage; // 한 페이지당 게시글 갯수
	private int lastPage; // 최종 페이지 번호
	private int start; // 현재 페이지의 게시글 시작 번호
	private int end; // 현재 페이지의 게시글 끝 번호
	private int cntPage = 10; // 한 페이지당 보여질 페이지 갯수

	public PagingUtil() {

	}

	public PagingUtil(int nowPage, int total, int perPage) {
		setNowPage(nowPage);
		setTotal(total);
		setPerPage(perPage);

		// 최종페이지 계산
		calcLastPage(total, perPage);
		// 시작 종료 페이지 번호 계산
		calcStartEndPage(nowPage);
		// 게시글 시작 종료 번호 계산
		calcStartEnd(nowPage, perPage);
	}

	public void calcStartEnd(int nowPage, int perPage) {
		int end = nowPage * perPage;
		int start = end - perPage + 1;

		setEnd(end);
		setStart(start);
	}

	public void calcStartEndPage(int nowPage) {
		// 현재 페이지 번호 3
		// 3/10 -> 0.3 -> 1*10 -> 10
		// 현재 페이지 번호 15
		// 15/10 -> 1.5 -> 2*10 -> 20

		int endPage = ((int) Math.ceil(nowPage / (double) cntPage)) * cntPage;
		int startPage = endPage - cntPage + 1;

		if (endPage > lastPage) {
			// 스타트페이지를 먼저 구한 후 엔드페이지가 라스트페이지를 넘지 않도록 조정
			endPage = lastPage;
		}

		if (startPage < 1) { // 스타트페이지는 1아래로 내려가지 않도록 조정
			startPage = 1;
		}

		setEndPage(endPage);
		setStartPage(startPage);
	}

	public void calcLastPage(int total, int perPage) {
		// 나눈 후 소수점 올림 처리
		int lastPage = (int) Math.ceil(total / (double) perPage);
		setLastPage(lastPage);
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

}
