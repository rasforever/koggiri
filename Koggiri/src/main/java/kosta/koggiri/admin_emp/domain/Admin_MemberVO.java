package kosta.koggiri.admin_emp.domain;

import java.io.Serializable;

public class Admin_MemberVO implements Serializable {
	private String mem_id;
	private String mem_pw;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	@Override
	public String toString() {
		return "Member [mem_id=" + mem_id + ", mem_pw=" + mem_pw + "]";
	}

	
	
	
	
}
