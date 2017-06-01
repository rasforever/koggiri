package kosta.koggiri.calendar.domain;

import java.io.Serializable;

public class EventVO implements Serializable {
	
	private String title;
	private String start_date;
	private String end_date;
	private String _id;
	private String content;
	private String mem_id;
	private String start;
	private String end;
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

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "Event [title=" + title + ", start_date=" + start_date + ", end_date=" + end_date + ", _id=" + _id
				+ ", content=" + content + ", mem_id=" + mem_id + "]";
	}
}
