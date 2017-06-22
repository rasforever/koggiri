package kosta.koggiri.jobis.domain;

public class Jobis_EmpVO {
	
	private String emp_id; //사번
	private String emp_nm; //이름
	private String att_dt; //일자
	private String att_time; //출근시간
	private String lea_time; //퇴근시간
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
	public String getLea_time() {
		return lea_time;
	}
	public void setLea_time(String lea_time) {
		this.lea_time = lea_time;
	}
	
	
	
	
}
