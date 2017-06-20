package kosta.koggiri.imageroom.domain;

import java.util.Date;

public class ImageRoomHisVO {
	private int image_room_his_no;
	private String image_room_his_contents;
	private Date image_room_his_regdate;
	private int room_id;
	private String emp_id;
	
	public ImageRoomHisVO(){}
	public ImageRoomHisVO(int image_room_his_no, String image_room_his_contents, Date image_room_his_regdate,
			 int room_id, String emp_id) {
		this.image_room_his_no = image_room_his_no;
		this.image_room_his_contents = image_room_his_contents;
		this.room_id = room_id;
		this.emp_id = emp_id;
	}
	
	public int getImage_room_his_no() {
		return image_room_his_no;
	}
	public void setImage_room_his_no(int image_room_his_no) {
		this.image_room_his_no = image_room_his_no;
	}
	public String getImage_room_his_contents() {
		return image_room_his_contents;
	}
	public void setImage_room_his_contents(String image_room_his_contents) {
		this.image_room_his_contents = image_room_his_contents;
	}
	public Date getImage_room_his_regdate() {
		return image_room_his_regdate;
	}
	public void setImage_room_his_regdate(Date image_room_his_regdate) {
		this.image_room_his_regdate = image_room_his_regdate;
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
		return "ImageRoomHisVO [image_room_his_no=" + image_room_his_no + ", image_room_his_contents="
				+ image_room_his_contents + ", image_room_his_regdate=" + image_room_his_regdate + ", room_id="
				+ room_id + ", emp_id=" + emp_id + "]";
	}
	
	
}
