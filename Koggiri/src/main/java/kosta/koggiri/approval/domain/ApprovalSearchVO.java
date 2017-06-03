package kosta.koggiri.approval.domain;

import java.util.Arrays;

public class ApprovalSearchVO extends Criteria{
	private String[] area;
	private String searchType;				//내가받은-보낸
	private String app_pro_cd;				//문서상태
	private String search_app_id; 			//문서번호 검색
	private String app_type;				//문서 타입 검색
	private String dept_cd;					//부서 코드
	private String draft_emp_id;			//기안자 
	private String app_emp_id;				//결재자
	private String draft_s_dt;				//작성시작일
	private String draft_e_dt;				//작성종료일
	public String[] getArea() {
		return area;
	}
	public void setArea(String[] area) {
		this.area = area;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getApp_pro_cd() {
		return app_pro_cd;
	}
	public void setApp_pro_cd(String app_pro_cd) {
		this.app_pro_cd = app_pro_cd;
	}
	
	public String getSearch_app_id() {
		return search_app_id;
	}
	public void setSearch_app_id(String search_app_id) {
		this.search_app_id = search_app_id;
	}
	public String getApp_type() {
		return app_type;
	}
	public void setApp_type(String app_type) {
		this.app_type = app_type;
	}
	public String getDept_cd() {
		return dept_cd;
	}
	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}
	public String getDraft_emp_id() {
		return draft_emp_id;
	}
	public void setDraft_emp_id(String draft_emp_id) {
		this.draft_emp_id = draft_emp_id;
	}
	public String getApp_emp_id() {
		return app_emp_id;
	}
	public void setApp_emp_id(String app_emp_id) {
		this.app_emp_id = app_emp_id;
	}
	public String getDraft_s_dt() {
		return draft_s_dt;
	}
	public void setDraft_s_dt(String draft_s_dt) {
		this.draft_s_dt = draft_s_dt;
	}
	public String getDraft_e_dt() {
		return draft_e_dt;
	}
	public void setDraft_e_dt(String draft_e_dt) {
		this.draft_e_dt = draft_e_dt;
	}
	@Override
	public String toString() {
		return "ApprovalSearchVO [area=" + Arrays.toString(area) + ", searchType=" + searchType + ", app_pro_cd="
				+ app_pro_cd + ", search_app_id=" + search_app_id + ", app_type=" + app_type + ", dept_cd=" + dept_cd
				+ ", draft_emp_id=" + draft_emp_id + ", app_emp_id=" + app_emp_id + ", draft_s_dt=" + draft_s_dt
				+ ", draft_e_dt=" + draft_e_dt + "]";
	}
	
	
	

}
