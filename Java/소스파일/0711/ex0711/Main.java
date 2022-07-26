package studyJava.ex0711;

public class Main {

	public static void main(String[] args) {
		//int[] intArray = null; //배열은 참조 타입이기 때문에 null로 초기화 가능
		
		//배열 선언시 데이터 초기화 -> {} 중괄호 블럭 사용 , 구분자로 데이터 나열
		int[] intArray = {10,20,30,40,50};
		
		//배열 변수 선언 후 값 대입하는 방법 -> new 연산자를 사용하여 배열을 생성하여 값을 대입
		int[] intArray2 = null;
		intArray2 = new int[]{10,20,30,40,50};
		
		//배열 생성시 원소는 모르나 길이를 사용하여 배열 생성하는 방법
		int[] intArray3 = new int[3];
		
		//배열의 원소에 접근하는 방법-> [index]
		int data = intArray3[0];
		System.out.println(data);
		
		//10,20,30 의 데이터를 가지고 있는 int 타입 배열을 만드세요
		int intArray4[] = {10,20,30};
		intArray4 = new int[] {10,20,30};
		//길이가 5인 문자열 배열을 선언해주세요.
		String[] strArray = new String[5];
		System.out.println(strArray[0]);
		
		int sum=0;
		//배열의 원소에 반복 접근하는 방법은 반복문을 사용하여 배열의 모든 인덱스에 접근한다.
		for(int i=0;i<intArray4.length;i++) {
			sum += intArray4[i];
		}
		System.out.println(sum);
		
		//자바에서의 배열은 길이가 정해지면 해당 인덱스 까지만 절대적으로 접근할 수 있다.
		//넘치는 인덱스에 접근하면 오류가 난다.
		//System.out.println(intArray4[3]);
		
		//학생 세명을 생성하세요.
		// 홍길일 - 230점, 홍길이-190점, 홍길삼 - 280점
		//배열을 사용하여 학생 세명의 평균 점수와 고득점 자의 이름을 출력하세요.
		Student s1 = new Student("홍길일",230);
		Student s2 = new Student("홍길이",190);
		Student s3 = new Student("홍길삼",280);
		
		//Student[] sA = {s1,s2,s3};

		//배열의 데이터 타입이 참조타입일 경우 원소에는 각 데이터의 주소를 참조하고 있다.
		String[] strArray2 = {new String("가"),new String("가")};
		System.out.println(strArray2[0]==strArray2[1]);
		
		Student[] sA = new Student[] {s1,s2,s3};
		sA = new Student[3];
		sA[0] = s1;
		sA[1] = s2;
		sA[2] = s3;
		sA = new Student[] { new Student("홍길일",230),new Student("홍길이",190), new Student("홍길삼",280)};
		
		sum =0; //세 학생의 점수 총합
		double avg =0;  // 세학생의 점수 평균
		
		int maxScore = 0; //고득점수
		String maxScoreName = ""; //고득점 학생명
		
		for(int i=0; i<sA.length;i++) {
			sum = sum+sA[i].getTotalScore();
			if(maxScore < sA[i].getTotalScore()) {
				maxScore = sA[i].getTotalScore();
				maxScoreName = sA[i].getName();
			}
		}
		avg = sum/sA.length;
		System.out.println("학생 평균 점수 : "+avg);
		System.out.println("최고점:"+maxScore);
		System.out.println("최고점자:"+maxScoreName);
		
		//향상된 포문 (배열의 인덱스에 알아서 반복을 하며 원소를 자동으로 꺼내 변수에 담아준다)
		//배열 sA의 모든 인덱스에 반복 접근하며 각 원소는 tempStudent에 담아라.
		//현재 접근하고 있는 인덱스 값이 필요 없는 경우 사용
		for(Student tempStudent : sA) {
			System.out.println("원소의 이름 : "+tempStudent.getName());
			System.out.println("원소의 점수 : "+tempStudent.getTotalScore());
		}
		
		int[] intArray5 = {10,20,30,40,50};
		//위 배열을 사용하여 향상된 for문으로 원소의 총 합을 출력하세요.
		sum =0;
		for(int temp : intArray5) {
			sum += temp;
		}
		System.out.println(sum);
		
		//변수 선언시
		int[][] intArray6 = {{1,2,3},{4,5,6}};
		/*
		  1 2 3
		  4 5 6
		 */
		int result =intArray6[1][2];
		System.out.println(result);
		//2 값이 출력 될 수 있도록 다차원 배열에 알맞게 접근하세요.
		System.out.println(intArray6[0][1]);
		
		Student[][] sArray = new Student[2][3];
		sArray[0][0] = new Student();
		sArray[0][1] = new Student();
		sArray[0][2] = new Student();
		//배열에서는 넘치는 인덱스의 데이터를 출력하려 할때 오류가 난다.
		sArray[0][3] = new Student();
		System.out.println(sArray[0][3].getName());
		
		intArray =new int[]{10,20,30,40,50};
		
		//자바에서 배열은 길이가 고정이기 때문에 배열의 길이를 변경하고 싶은 경우
		// 더 큰 배열을 만들어 하나씩 복사해줘야 한다.
		int[] copyArray = new int[10];
		for(int i=0; i<intArray.length;i++) {
			copyArray[i] = intArray[i];
		}
		for(int i = intArray.length;i<copyArray.length;i++) {
			int temp = i*10;
			copyArray[i] = temp;
		}
		
	}

}







