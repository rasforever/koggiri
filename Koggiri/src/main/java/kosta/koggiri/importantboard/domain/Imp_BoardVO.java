package kosta.koggiri.importantboard.domain;

import java.util.Arrays;
import java.util.Date;

public class Imp_BoardVO {

	private Integer I_ID;
	private String I_TITLE;
	private String I_CONTENT;
	private String I_EMP_ID;
	private Date I_DATE;
	private int I_HIT;
	
private String[] files;
	
	
	

	public Integer getI_ID() {
		return I_ID;
	}
	public void setI_ID(Integer i_ID) {
		I_ID = i_ID;
	}
	public String getI_TITLE() {
		return I_TITLE;
	}
	public void setI_TITLE(String i_TITLE) {
		I_TITLE = i_TITLE;
	}
	public String getI_CONTENT() {
		return I_CONTENT;
	}
	public void setI_CONTENT(String i_CONTENT) {
		I_CONTENT = i_CONTENT;
	}
	public String getI_EMP_ID() {
		return I_EMP_ID;
	}
	public void setI_EMP_ID(String i_EMP_ID) {
		I_EMP_ID = i_EMP_ID;
	}
	public Date getI_DATE() {
		return I_DATE;
	}
	public void setI_DATE(Date i_DATE) {
		I_DATE = i_DATE;
	}
	public int getI_HIT() {
		return I_HIT;
	}
	public void setI_HIT(int i_HIT) {
		I_HIT = i_HIT;
	}
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	
	@Override
	public String toString() {
		return "Imp_BoardVO [I_ID=" + I_ID + ", I_TITLE=" + I_TITLE + ", I_CONTENT=" + I_CONTENT + ", I_EMP_ID="
				+ I_EMP_ID + ", I_DATE=" + I_DATE + ", I_HIT=" + I_HIT + ", files=" + Arrays.toString(files) + "]";
	}
	
	
}
