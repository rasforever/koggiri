package kosta.koggiri.admin_emp.domain;


public class EmpInfo_AdminVO {
	private String emp_id;	
	private String dept_id;
	private String pos_id;
	private String e_mail;
	private String tel_no;
	private String addr;
	private Integer res_type;
	private String expire_dt;
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
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
	public Integer getRes_type() {
		return res_type;
	}
	public void setRes_type(Integer res_type) {
		this.res_type = res_type;
	}
	public String getExpire_dt() {
		return expire_dt;
	}
	public void setExpire_dt(String expire_dt) {
		this.expire_dt = expire_dt;
	}


}
