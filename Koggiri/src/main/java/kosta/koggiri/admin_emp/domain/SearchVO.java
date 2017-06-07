package kosta.koggiri.admin_emp.domain;

public class SearchVO {
	private String area;
	private String searchKey;
	
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	@Override
	public String toString() {
		return "Search [area=" + area + ", searchKey=" + searchKey + "]";
	}
	
}
