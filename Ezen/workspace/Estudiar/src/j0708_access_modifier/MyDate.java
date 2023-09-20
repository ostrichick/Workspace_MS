package j0708_access_modifier;

public class MyDate {
	private int day;
	private int month;
	private int year;

	public MyDate(int day, int month, int year) {
		this.day = day;
		this.month = month;
		this.year = year;
	}

	public boolean isValid() {
		if (day < 1 || day > 31) {
			System.out.println("안됨");
			return false;
		} else {
			System.out.println("됨");
			return true;
		}
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		if (month == 2) {
			if (day < 1 || day > 28) {
				System.out.println("오류");
			} else {
				this.day = day;
			}
		}
	}
//
	//
}
