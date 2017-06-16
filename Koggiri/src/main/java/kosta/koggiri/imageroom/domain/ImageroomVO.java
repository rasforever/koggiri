package kosta.koggiri.imageroom.domain;

public class ImageroomVO {
	
	private int room_id;
	private String room_nm;
	private String emp_id;
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_nm() {
		return room_nm;
	}
	public void setRoom_nm(String room_nm) {
		this.room_nm = room_nm;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	@Override
	public String toString() {
		return "ImageroomVO [room_id=" + room_id + ", room_nm=" + room_nm + ", emp_id=" + emp_id + "]";
	}	
	
	

}
