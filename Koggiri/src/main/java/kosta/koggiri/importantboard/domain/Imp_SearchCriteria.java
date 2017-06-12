package kosta.koggiri.importantboard.domain;

import kosta.koggiri.importantboard.domain.Imp_Criteria;

public class Imp_SearchCriteria extends Imp_Criteria{

	private String searchType;
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return super.toString() + " Imp_SearchCriteria "
				+ "[searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}
}



