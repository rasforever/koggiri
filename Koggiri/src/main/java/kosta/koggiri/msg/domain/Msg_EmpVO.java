package kosta.koggiri.msg.domain;

public class Msg_EmpVO {
	private String emp_id;
	private String emp_nm;
	private String dept_nm;
	private String dept_id;
	private String pos_id;
	private String pos_nm;
	private String c_count;
	
	public Msg_EmpVO(String emp_id, String emp_nm, String dept_nm, String dept_id, String pos_id, String pos_nm,
			String c_count) {
		super();
		this.emp_id = emp_id;
		this.emp_nm = emp_nm;
		this.dept_nm = dept_nm;
		this.dept_id = dept_id;
		this.pos_id = pos_id;
		this.pos_nm = pos_nm;
		this.c_count = c_count;
	}
	
	

	public Msg_EmpVO() {}



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

	public String getC_count() {
		return c_count;
	}

	public void setC_count(String c_count) {
		this.c_count = c_count;
	}
	
	
	

}
