package kosta.koggiri.admin_emp.domain;

public class Per_AppVO {
	private String emp_id;  //사번
	private String emp_nm;  //사원명
	private String dept_id;  //변경부서코드
	private String dept_nm;  //변경부서명
	private String pos_id;	//변경직급코드
  	private String pos_nm;	//변경직급명
	private String per_cd; //인사발령코드
	private String per_nm;	//인사발령명
	private String per_dt;		//변경일자
	
	
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
	public String getPer_cd() {
		return per_cd;
	}
	public void setPer_cd(String per_cd) {
		this.per_cd = per_cd;
	}
	public String getPer_nm() {
		return per_nm;
	}
	public void setPer_nm(String per_nm) {
		this.per_nm = per_nm;
	}
	public String getPer_dt() {
		return per_dt;
	}
	public void setPer_dt(String per_dt) {
		this.per_dt = per_dt;
	}
	
	
	

}
