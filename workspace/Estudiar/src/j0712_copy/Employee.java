package j0712_copy;

public class Employee {
	public String name;
	public String grade;

	public Employee(String name) {
		this.name = name;
	}
}

class Engineer extends Employee {
	private String skillset;

	public String getSkillSet() {
		return skillset;
	}

	public Engineer(String employeeName) {
		super(employeeName);
	}

	public void setSkillSet(String skillset) {
		this.skillset = skillset;
	}

}