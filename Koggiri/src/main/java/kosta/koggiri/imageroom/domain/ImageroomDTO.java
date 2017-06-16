package kosta.koggiri.imageroom.domain;

public class ImageroomDTO extends ImageroomVO {
	private String emp_nm;
	private String dept_nm;
	private String pos_nm;
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
	public String getPos_nm() {
		return pos_nm;
	}
	public void setPos_nm(String pos_nm) {
		this.pos_nm = pos_nm;
	}
	@Override
	public String toString() {
		return "ImageroomDTO [emp_nm=" + emp_nm + ", dept_nm=" + dept_nm + ", pos_nm=" + pos_nm + "]";
	}
	
	
}
