package kosta.koggiri.home.domain;

public class H_calendarVO {
	
	private String event_id;
	private String title;
	private String start_date;
	private String end_date;
	private String content;
	private  String mem_id;
	
	public void H_calendatVO(){}

	public H_calendarVO(String event_id, String title, String start_date, String end_date, String content,
			String mem_id) {
		super();
		this.event_id = event_id;
		this.title = title;
		this.start_date = start_date;
		this.end_date = end_date;
		this.content = content;
		this.mem_id = mem_id;
	}

	public String getEvent_id() {
		return event_id;
	}

	public void setEvent_id(String event_id) {
		this.event_id = event_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	

}
