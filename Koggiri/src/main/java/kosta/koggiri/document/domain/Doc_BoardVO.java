package kosta.koggiri.document.domain;

import java.util.Date;

public class Doc_BoardVO {
	
	private Integer f_id;
	private String f_title;
	private String f_content;
	private String f_emp_id;
	private Date f_date;
	private int f_hit;
	public Integer getF_id() {
		return f_id;
	}
	public void setF_id(Integer f_id) {
		this.f_id = f_id;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public String getF_emp_id() {
		return f_emp_id;
	}
	public void setF_emp_id(String f_emp_id) {
		this.f_emp_id = f_emp_id;
	}
	public Date getF_date() {
		return f_date;
	}
	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}
	public int getF_hit() {
		return f_hit;
	}
	public void setF_hit(int f_hit) {
		this.f_hit = f_hit;
	}
	
	@Override
	public String toString() {
		return "Doc_BoardVO [f_id=" + f_id + ", f_title=" + f_title + ", f_content=" + f_content + ", f_emp_id="
				+ f_emp_id + ", f_date=" + f_date + ", f_hit=" + f_hit + "]";
	}
	
	
	

}
