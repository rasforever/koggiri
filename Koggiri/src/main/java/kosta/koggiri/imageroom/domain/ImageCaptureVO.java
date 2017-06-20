package kosta.koggiri.imageroom.domain;

import java.util.Date;

public class ImageCaptureVO {
	private int image_capture_no;
	private String image_capture_contents;
	private String image_capture_explain;
	private Date image_capture_regdate;
	private int room_id;
	private String emp_id;
	
	public ImageCaptureVO(){}
	public ImageCaptureVO(int image_capture_no, String image_capture_contents, String image_capture_explain,
			Date image_capture_regdate, int room_id, String emp_id) {
		this.image_capture_no = image_capture_no;
		this.image_capture_contents = image_capture_contents;
		this.image_capture_explain = image_capture_explain;
		this.image_capture_regdate = image_capture_regdate;
		this.room_id = room_id;
		this.emp_id = emp_id;
	}
	
	public int getImage_capture_no() {
		return image_capture_no;
	}
	public void setImage_capture_no(int image_capture_no) {
		this.image_capture_no = image_capture_no;
	}
	public String getImage_capture_contents() {
		return image_capture_contents;
	}
	public void setImage_capture_contents(String image_capture_contents) {
		this.image_capture_contents = image_capture_contents;
	}
	public String getImage_capture_explain() {
		return image_capture_explain;
	}
	public void setImage_capture_explain(String image_capture_explain) {
		this.image_capture_explain = image_capture_explain;
	}
	public Date getImage_capture_regdate() {
		return image_capture_regdate;
	}
	public void setImage_capture_regdate(Date image_capture_regdate) {
		this.image_capture_regdate = image_capture_regdate;
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
		return "ImageCaptureVO [image_capture_no=" + image_capture_no + ", image_capture_contents="
				+ image_capture_contents + ", image_capture_explain=" + image_capture_explain
				+ ", image_capture_regdate=" + image_capture_regdate + ", room_id=" + room_id + ", emp_id="
				+ emp_id + "]";
	}
}
