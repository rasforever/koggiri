package kosta.koggiri.noticeboard.domain;

import java.util.Date;

public class Noti_BoardVO {
	private Integer N_ID;
	private String N_TITLE;
	private String N_CONTENT;
	private String N_EMP_ID;
	private Date N_DATE;
	private int N_HIT;
	
	private String[] files;
	
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public Integer getN_ID() {
		return N_ID;
	}
	public void setN_ID(Integer n_ID) {
		N_ID = n_ID;
	}
	public String getN_TITLE() {
		return N_TITLE;
	}

	public void setN_TITLE(String n_TITLE) {
		N_TITLE = n_TITLE;
	}

	public String getN_CONTENT() {
		return N_CONTENT;
	}

	public void setN_CONTENT(String n_CONTENT) {
		N_CONTENT = n_CONTENT;
	}

	public String getN_EMP_ID() {
		return N_EMP_ID;
	}

	public void setN_EMP_ID(String n_EMP_ID) {
		N_EMP_ID = n_EMP_ID;
	}

	public Date getN_DATE() {
		return N_DATE;
	}

	public void setN_DATE(Date n_DATE) {
		N_DATE = n_DATE;
	}

	public int getN_HIT() {
		return N_HIT;
	}

	public void setN_HIT(int n_HIT) {
		N_HIT = n_HIT;
	}

	@Override
	public String toString() {
		return "VO [N_ID=" + N_ID + ", N_TITLE=" + N_TITLE + ", N_CONTENT="
				+ N_CONTENT + ", N_EMP_ID=" + N_EMP_ID + ", N_DATE=" + N_DATE
				+ ", N_HIT=" + N_HIT + "]";
	}
}
