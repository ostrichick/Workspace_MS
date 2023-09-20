package boardStudy;

public class User {
	private String id;
	private String name;
	private String password;
	private String addr;
	private int uidx;

//	User() {
//	}
//
//	public User(String id, String name, String password, String addr, int uidx) {
//		super();
//		this.id = id;
//		this.name = name;
//		this.password = password;
//		this.addr = addr;
//		this.uidx = uidx;
//	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getUidx() {
		return uidx;
	}

	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
}
