package kosta.koggiri.approval.domain;

public class DeptVO {

	private String dept_id;
	private String dept_nm;
	private String dept_e_nm;
	
	public DeptVO() {}

	public DeptVO(String dept_id, String dept_nm, String dept_e_nm) {
		super();
		this.dept_id = dept_id;
		this.dept_nm = dept_nm;
		this.dept_e_nm = dept_e_nm;
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public String getDept_nm() {
		return dept_nm;
	}

	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	public String getDept_e_nm() {
		return dept_e_nm;
	}

	public void setDept_e_nm(String dept_e_nm) {
		this.dept_e_nm = dept_e_nm;
	}
	
}
