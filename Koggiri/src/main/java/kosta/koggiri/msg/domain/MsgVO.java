package kosta.koggiri.msg.domain;

public class MsgVO {
	private Integer msg_id;
	private String emp_id;
	private String emp_nm;
	private String n_emp_id;
	private String input_text;
	private String input_date;
	private Integer msg_count;
	
	public MsgVO(){}
	
	public MsgVO(Integer msg_id, String emp_id, String emp_nm, String n_emp_id, String input_text, String input_date,
			Integer msg_count) {
		super();
		this.msg_id = msg_id;
		this.emp_id = emp_id;
		this.emp_nm = emp_nm;
		this.n_emp_id = n_emp_id;
		this.input_text = input_text;
		this.input_date = input_date;
		this.msg_count = msg_count;
	}

	public Integer getMsg_id() {
		return msg_id;
	}

	public void setMsg_id(Integer msg_id) {
		this.msg_id = msg_id;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_nm() {
		return emp_nm;
	}

	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
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

	public String getInput_date() {
		return input_date;
	}

	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}

	public Integer getMsg_count() {
		return msg_count;
	}

	public void setMsg_count(Integer msg_count) {
		this.msg_count = msg_count;
	}
	
	
	
	
	

	
}
