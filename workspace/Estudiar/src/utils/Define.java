package utils;

public enum Define {
//	public static final int Korean = 1001;
//	public static final int MATH = 2001;
//
//	public static final int AB_TYPE = 0;
//	public static final int SAB_TYPE = 1;

	KOREAN(1001), MATH(2001), AB_TYPE(true), SAB_TYPE(false), TITLE(" 수강생 학점 \t\t\n"), HEADER(" 이름 | 학번 |필수과목| 점수  \n"),
	LINE("----------------------\n");

	int code;
	boolean isAB;
	String format;

	private Define(int code) {
		this.code = code;
	}

	private Define(boolean isAB) {
		this.isAB = isAB;
	}

	private Define(String format) {
		this.format = format;
	}
}
