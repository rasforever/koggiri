package kosta.koggiri.jobis.domain;

import java.sql.Timestamp;

public class Jobis_EmpVO {
	
	private String emp_id; //사번
	private String emp_nm; //이름
	private String att_dt; //일자
	private String att_time; //출근시간
	private String lea_time; //퇴근시간
	private String app_id; //결재문서 문서코드
	private Timestamp input_sysdt; //결재문서기안일
	private String app_title; //문서이름
	private String pos_nm;//직급이름
	private String dept_nm;//부서이름
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
	public String getApp_id() {
		return app_id;
	}
	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}
	public Timestamp getInput_sysdt() {
		return input_sysdt;
	}
	public void setInput_sysdt(Timestamp input_sysdt) {
		this.input_sysdt = input_sysdt;
	}
	public String getApp_title() {
		return app_title;
	}
	public void setApp_title(String app_title) {
		this.app_title = app_title;
	}
	public String getPos_nm() {
		return pos_nm;
	}
	public void setPos_nm(String pos_nm) {
		this.pos_nm = pos_nm;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	
	
	
}
