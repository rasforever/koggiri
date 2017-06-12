package kosta.koggiri.sns.domain;

import java.util.Date;

public class RoomVO {
	
	private int room_id; //방 id
	private String emp_id; //내id
	private String n_emp_id; //상대방id
	private String input_text; //입력데이터
	private Date input_date; //입력시간
	
	public RoomVO(){} //디폴트 생성자를 꼭 만들어줘야한다.

	public RoomVO(int room_id, String emp_id, String n_emp_id, String input_text, Date input_date) {
		super();
		this.room_id = room_id;
		this.emp_id = emp_id;
		this.n_emp_id = n_emp_id;
		this.input_text = input_text;
		this.input_date = input_date;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getN_emp_id() {
		return n_emp_id;
	}

	public void setN_emp_id(String n_emp_id) {
		this.n_emp_id = n_emp_id;
	}

	public String getInput_text() {
		return input_text;
	}

	public void setInput_text(String input_text) {
		this.input_text = input_text;
	}

	public Date getInput_date() {
		return input_date;
	}

	public void setInput_date(Date input_date) {
		this.input_date = input_date;
	}

	@Override
	public String toString() {
		return "RoomVO [room_id=" + room_id + ", emp_id=" + emp_id + ", n_emp_id=" + n_emp_id + ", input_text="
				+ input_text + ", input_date=" + input_date + "]";
	}
	
	
	

}