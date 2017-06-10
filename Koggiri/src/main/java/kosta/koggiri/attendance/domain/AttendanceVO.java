package kosta.koggiri.attendance.domain;

public class AttendanceVO {
	private String emp_id;
	private String emp_nm;
	private String dept_id;
	private String dept_nm;
	private String att_dt;
	private String att_time;
	private String lev_time;
	
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
	public String getAtt_dt() {
		return att_dt;
	}
	public void setAtt_dt(String att_dt) {
		this.att_dt = att_dt;
	}
	public String getAtt_time() {
		return att_time;
	}
	public void setAtt_time(String att_time) {
		this.att_time = att_time;
	}
	public String getLev_time() {
		return lev_time;
	}
	public void setLev_time(String lev_time) {
		this.lev_time = lev_time;
	}
	

}
