package ezen.maru.pjt.vo;

public class FileVo extends BoardVo {

	private String file_original;
	private String file_system;
	private String file_extension;

	public String getFile_original() {
		return file_original;
	}

	public void setFile_original(String file_original) {
		this.file_original = file_original;
	}

	public String getFile_system() {
		return file_system;
	}

	public void setFile_system(String file_system) {
		this.file_system = file_system;
	}

	public String getFile_extension() {
		return file_extension;
	}

	public void setFile_extension(String file_extension) {
		this.file_extension = file_extension;
	}

	//////////////
	// MARU end //
	//////////////
	private int file_idx;
	private String origin_filename1;
	private String origin_filename2;
	private String origin_filename3;
	private String system_filename1;
	private String system_filename2;
	private String system_filename3;

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}

	public String getOrigin_filename1() {
		return origin_filename1;
	}

	public void setOrigin_filename1(String origin_filename1) {
		this.origin_filename1 = origin_filename1;
	}

	public String getOrigin_filename2() {
		return origin_filename2;
	}

	public void setOrigin_filename2(String origin_filename2) {
		this.origin_filename2 = origin_filename2;
	}

	public String getOrigin_filename3() {
		return origin_filename3;
	}

	public void setOrigin_filename3(String origin_filename3) {
		this.origin_filename3 = origin_filename3;
	}

	public String getSystem_filename1() {
		return system_filename1;
	}

	public void setSystem_filename1(String system_filename1) {
		this.system_filename1 = system_filename1;
	}

	public String getSystem_filename2() {
		return system_filename2;
	}

	public void setSystem_filename2(String system_filename2) {
		this.system_filename2 = system_filename2;
	}

	public String getSystem_filename3() {
		return system_filename3;
	}

	public void setSystem_filename3(String system_filename3) {
		this.system_filename3 = system_filename3;
	}

}
