package kosta.koggiri.admin_emp.domain;

public class Res_AppVO {
	private String emp_id;  //사번
	private String emp_nm;  //사원명
	private String dept_id;  //부서코드
	private String dept_nm;  //부서명
	private String pos_id;	//직급코드
  	private String pos_nm;	//직급명
  	private String res_type;	//퇴직사유코드
  	private String res_name;	//퇴직사유명
  	private String expire_dt;	//퇴직일
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
	public String getRes_type() {
		return res_type;
	}
	public void setRes_type(String res_type) {
		this.res_type = res_type;
	}
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getExpire_dt() {
		return expire_dt;
	}
	public void setExpire_dt(String expire_dt) {
		this.expire_dt = expire_dt;
	}
  	
  	

}
