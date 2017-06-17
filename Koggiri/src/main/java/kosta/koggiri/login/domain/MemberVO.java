package kosta.koggiri.login.domain;

import java.io.Serializable;

public class MemberVO implements Serializable{
	private String mem_id;
	private String mem_pw;
	private String dept_id;
	private String e_mail1;
	private String e_mail2;
	
	private String mem_aut_cd;
	
	private String e_mail;
	private String tel_no;
	private String telno1;
	private String telno2;
	private String telno3;
	
	private String addr;
	private String addr1;
	private String addr2;
	
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
	
	
	 public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public boolean matchPassword(String pwd){
		 return mem_pw.equals(pwd);
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
	public String getE_mail1() {
		return e_mail1;
	}
	public void setE_mail1(String e_mail1) {
		this.e_mail1 = e_mail1;
	}
	public String getE_mail2() {
		return e_mail2;
	}
	public void setE_mail2(String e_mail2) {
		this.e_mail2 = e_mail2;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	
	public String getTelno1() {
		return telno1;
	}
	public void setTelno1(String telno1) {
		this.telno1 = telno1;
	}
	public String getTelno2() {
		return telno2;
	}
	public void setTelno2(String telno2) {
		this.telno2 = telno2;
	}
	public String getTelno3() {
		return telno3;
	}
	public void setTelno3(String telno3) {
		this.telno3 = telno3;
	}
	public String getMem_aut_cd() {
		return mem_aut_cd;
	}
	public void setMem_aut_cd(String mem_aut_cd) {
		this.mem_aut_cd = mem_aut_cd;
	}
	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", dept_id=" + dept_id + ", e_mail1=" + e_mail1
				+ ", e_mail2=" + e_mail2 + ", mem_aut_cd=" + mem_aut_cd + ", e_mail=" + e_mail + ", tel_no=" + tel_no
				+ ", telno1=" + telno1 + ", telno2=" + telno2 + ", telno3=" + telno3 + ", addr=" + addr + ", addr1="
				+ addr1 + ", addr2=" + addr2 + "]";
	}
	
	
	
}
