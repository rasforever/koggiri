package kosta.koggiri.task.domain;

import java.util.Date;

public class TaskVO {

   @Override
   public String toString() {
      return "TaskVO [emp_id=" + emp_id + ", ta_seq=" + ta_seq + ", ta_date=" + ta_date + ", ta_nextresult="
            + ta_nextresult + ", ta_weekresult=" + ta_weekresult + ", ta_regdate=" + ta_regdate + ", ta_hitcount="
            + ta_hitcount + ", emp_nm=" + emp_nm + "]";
   }

   private String emp_id;
   private Integer ta_seq;
   private String ta_date;
   private String ta_nextresult;
   private String ta_weekresult;
   private Date ta_regdate;
   private Integer ta_hitcount;
   private String emp_nm;
   private String mem_aut_cd;
   private String dept_id;
   private String pos_id;
   
   
   

   public String getMem_aut_cd() {
      return mem_aut_cd;
   }

   public void setMem_aut_cd(String mem_aut_cd) {
      this.mem_aut_cd = mem_aut_cd;
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

   public String getEmp_nm() {
      return emp_nm;
   }

   public void setEmp_nm(String emp_nm) {
      this.emp_nm = emp_nm;
   }

   public void setTa_seq(Integer ta_seq) {
      this.ta_seq = ta_seq;
   }

   public String getEmp_id() {
      return emp_id;
   }

   public void setEmp_id(String emp_id) {
      this.emp_id = emp_id;
   }

   public Integer getTa_seq() {
      return ta_seq;
   }

   public void setTa_seq(int ta_seq) {
      this.ta_seq = ta_seq;
   }

   public String getTa_date() {
      return ta_date;
   }

   public void setTa_date(String ta_date) {
      this.ta_date = ta_date;
   }

   public String getTa_nextresult() {
      return ta_nextresult;
   }

   public void setTa_nextresult(String ta_nextresult) {
      this.ta_nextresult = ta_nextresult;
   }

   public String getTa_weekresult() {
      return ta_weekresult;
   }

   public void setTa_weekresult(String ta_weekresult) {
      this.ta_weekresult = ta_weekresult;
   }

   public Date getTa_regdate() {
      return ta_regdate;
   }

   public void setTa_regdate(Date ta_regdate) {
      this.ta_regdate = ta_regdate;
   }

   public Integer getTa_hitcount() {
      return ta_hitcount;
   }

   public void setTa_hitcount(Integer ta_hitcount) {
      this.ta_hitcount = ta_hitcount;
   }

   

}