package studyJava.ex0706;

public class Example02 {

	public static void main(String[] args) {
		System.out.println("---------------Q01--------------");
		int num1=10;
		int num2=2;
		char operator='+';
		
		if(operator == '+') {
			System.out.println(num1+"+"+num2+"="+(num1+num2));
		}else if(operator == '-') {
			System.out.println(num1+"-"+num2+"="+(num1-num2));
		}else if(operator == '*') {
			System.out.println(num1+"*"+num2+"="+(num1*num2));
		}else if(operator == '/') {
			System.out.println(num1+"/"+num2+"="+(num1/num2));
		}
		
		switch(operator) {
		case '+':
			System.out.println(num1+"+"+num2+"="+(num1+num2));
			break;
		case '-':
			System.out.println(num1+"-"+num2+"="+(num1-num2));
			break;
		case '*':
			System.out.println(num1+"*"+num2+"="+(num1*num2));
			break;
		case '/':
			System.out.println(num1+"/"+num2+"="+(num1/num2));
			break;
		default:
			System.out.println("연산자가 올바르지 않습니다.");
		}
		
		System.out.println("------------------Q02--------------------");
		for(int i=1; i<=9;i++) {
			if(i%2 != 0) {
				continue; 
			}
			System.out.println("-----------["+i+"단]------------");
			for(int j=1; j<=9; j++) {
				System.out.println(i+"*"+j+"="+(i*j));
			}
		}
		System.out.println("------------------Q03--------------------");
		for(int i=1; i<=9;i++) {
			System.out.println("-----------["+i+"단]------------");
			for(int j=1; j<=9; j++) {
				if(i<j) {
					break; 
				}
				System.out.println(i+"*"+j+"="+(i*j));
			}
		}
		System.out.println("------------------Q04--------------------");
        int starCount= 1;
        int spaceCount = 4/2 + 1;
        
        for(int i =0; i<4; i++){
        	for(int j=0; j<spaceCount; j++){ 
            	System.out.print(" ");
            }
            for(int j=0; j<starCount; j++){ 
            	System.out.print("*");
            }
            for(int j=0; j<spaceCount; j++){ 
            	System.out.print(" ");
            }

            spaceCount -= 1;
            starCount += 2;
            System.out.println("");
        }
        
        System.out.println("------------------Q05--------------------");
        starCount= 1;
        spaceCount = 4/2 + 1;
        for(int i =0; i<4; i++){
        	for(int j=0; j<spaceCount; j++){ 
            	System.out.print(" ");
            }
            for(int j=0; j<starCount; j++){ 
            	System.out.print("*");
            }
            for(int j=0; j<spaceCount; j++){ 
            	System.out.print(" ");
            }

            spaceCount -= 1;
            starCount += 2;
            System.out.println("");
        }
        for(int i =0; i<4; i++){
        	spaceCount += 1;
            starCount -= 2;
            
        	for(int j=0; j<spaceCount; j++){ 
            	System.out.print(" ");
            }
            for(int j=0; j<starCount; j++){ 
            	System.out.print("*");
            }
            for(int j=0; j<spaceCount; j++){ 
            	System.out.print(" ");
            }
            System.out.println("");
        }
	}

}
