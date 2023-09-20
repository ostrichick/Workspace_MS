package j0711_array;

public class DogTest {

	public static void main(String[] args) {
		Dog d1 = new Dog("김삼식", "불독");
		Dog d2 = new Dog("뽀삐", "말티즈");
		Dog d3 = new Dog("해피", "시츄");
		Dog d4 = new Dog("거렁뱅이", "똥깨");
		Dog d5 = new Dog("도진", "진도");
		Dog[] dogList = new Dog[] { d1, d2, d3, d4, d5 };

		for (int i = 0; i < dogList.length; i++) {
			System.out.println(dogList[i].showDogInfo());
		}
	}

}
