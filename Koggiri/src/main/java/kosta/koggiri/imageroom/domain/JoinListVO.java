package kosta.koggiri.imageroom.domain;

public class JoinListVO {
	private int room_id;
	private String emp_id;
	
	public JoinListVO(int room_id, String emp_id) {
		this.room_id = room_id;
		this.emp_id = emp_id;
	}
	
	public int getroom_id() {
		return room_id;
	}
	public void setroom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getemp_id() {
		return emp_id;
	}
	public void setemp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	
	@Override
	public String toString() {
		return "JoinListVO [room_id=" + room_id + ", emp_id=" + emp_id + "]";
	}
}
