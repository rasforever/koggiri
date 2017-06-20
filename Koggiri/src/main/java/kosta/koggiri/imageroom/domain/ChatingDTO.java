package kosta.koggiri.imageroom.domain;

import java.util.Date;

public class ChatingDTO extends ImageRoomHisVO{
	private String emp_nm;
	private String dept_nm;

	
	public ChatingDTO(){}
	public ChatingDTO(String emp_nm, String dept_nm) {
		super();
		this.emp_nm = emp_nm;
		this.dept_nm = dept_nm;

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
	
	
}
