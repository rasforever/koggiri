package kosta.koggiri.task.domain;

public class TaskSearchCriteria extends TaskCriteria {
	
	private String keyword;
	

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "TaskSearchCriteria [keyword=" + keyword + "]";
	}
	
	
	
	

}
