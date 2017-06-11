package kosta.koggiri.sns.domain;

public class SnsVO {
	
	private String emp_id;
	private String emp_nm;
	private String dept_nm;
	private String dept_id;
	private String pos_id;
	private String pos_nm;
	
	public SnsVO() {}
	
	public SnsVO(String emp_id, String emp_nm, String dept_nm, String dept_id, String pos_id, String pos_nm) {
		super();
		this.emp_id = emp_id;
		this.emp_nm = emp_nm;
		this.dept_nm = dept_nm;
		this.dept_id = dept_id;
		this.pos_id = pos_id;
		this.pos_nm = pos_nm;
	}


	public String getEmp_id() {
		return emp_id;
	}


	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}


	public String getEmp_nm() {
		return emp_nm;
	}


	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}


	public String getDept_nm() {
		return dept_nm;
	}


	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}


	public String getDept_id() {
		return dept_id;
	}


	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}


	public String getPos_id() {
		return pos_id;
	}


	public void setPos_id(String pos_id) {
		this.pos_id = pos_id;
	}


	public String getPos_nm() {
		return pos_nm;
	}


	public void setPos_nm(String pos_nm) {
		this.pos_nm = pos_nm;
	}


	@Override
	public String toString() {
		return "SnsVO [emp_id=" + emp_id + ", emp_nm=" + emp_nm + ", dept_nm=" + dept_nm + ", dept_id=" + dept_id
				+ ", pos_id=" + pos_id + ", pos_nm=" + pos_nm + "]";
	}
	
	
	
	
	
	

}
