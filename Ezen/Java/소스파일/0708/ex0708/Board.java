package studyJava.ex0708;

//��ƼƼ Ŭ����
//�����͸� ��� ������ �������� ������� Ŭ�����̴�.
public class Board {
	//�ʵ��� ���������ڴ� ��� private�� �����Ͽ� �ܺο��� �ʵ忡 ����������
	//���� ���� ���ϵ��� �����Ѵ�.
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
	public void setTitle(String title) {
		//�ʵ� title�� ä������� �����͸� �����ؾ��Ѵٸ�
		//�� ��ġ���� �� �� �Ʒ����� �ʵ忡 �����͸� ä���.
		this.title =title;
	}
	//title�� ������ �ʵ��� setter �����
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public String getTitle(){
		return title;
	}
	
	////title�� ������ �ʵ��� getter �����
	public int getHit() {
		return hit;
	}
	*/
	
	
}





