package kosta.koggiri.admin_emp.domain;

import java.io.Serializable;
import java.sql.Date;


public class EmpVO implements Serializable{

	private String emp_nm;
	private String pos_id;
	private String dept_id;
	private String join_dt;
	private String emp_id;
	private String res_no;
	private String sex_id;
	private String nation_id;
	private String wstate_cd;
	private String input_emp_id;
	private String mem_pw;
	private String e_mail;
	private String tel_no;
	private String addr;
	
	
	public String getNation_id() {
		return nation_id;
	}
	public void setNation_id(String nation_id) {
		this.nation_id = nation_id;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public String getPos_id() {
		return pos_id;
	}
	public void setPos_id(String pos_id) {
		this.pos_id = pos_id;
	}
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getJoin_dt() {
		return join_dt;
	}
	public void setJoin_dt(String join_dt) {
		this.join_dt = join_dt;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getRes_no() {
		return res_no;
	}
	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}
	public String getSex_id() {
		return sex_id;
	}
	public void setSex_id(String sex_id) {
		this.sex_id = sex_id;
	}

	public String getWstate_cd() {
		return wstate_cd;
	}
	public void setWstate_cd(String wstate_cd) {
		this.wstate_cd = wstate_cd;
	}
	public String getInput_emp_id() {
		return input_emp_id;
	}
	public void setInput_emp_id(String input_emp_id) {
		this.input_emp_id = input_emp_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	
	
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getTel_no() {
		return tel_no;
	}
	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "Emp [emp_nm=" + emp_nm + ", pos_id=" + pos_id + ", dept_id=" + dept_id + ", join_dt=" + join_dt
				+ ", emp_id=" + emp_id + ", res_no=" + res_no + ", sex_id=" + sex_id + ", nation_id=" + nation_id
				+ ", wstate_cd=" + wstate_cd + ", input_emp_id=" + input_emp_id + ", mem_pw=" + mem_pw + ", e_mail="
				+ e_mail + ", tel_no=" + tel_no + ", addr=" + addr + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
