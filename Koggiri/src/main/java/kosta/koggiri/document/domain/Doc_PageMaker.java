package kosta.koggiri.document.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Doc_PageMaker {
	
	 private int totalCount;
	  private int startPage;
	  private int endPage;
	  private boolean prev;
	  private boolean next;

	  private int displayPageNum = 3; //화면에 보여지는 페이지번호의 숫자를 의미하는 변수 3이라고 하면 화면밑에 3개의 번호가 뜸

	  private Doc_Criteria cri;

	  public void setCri(Doc_Criteria cri) {
	    this.cri = cri;
	  }

	  public void setTotalCount(int totalCount) {
	    this.totalCount = totalCount;

	    calcData(); //totalCount가 설정되는 시점에 calcData()를 실행해 필요한 값 계산
	  }

	  private void calcData() {

	    endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

	    startPage = (endPage - displayPageNum) + 1;

	    int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

	    if (endPage > tempEndPage) {
	      endPage = tempEndPage;
	    }

	    prev = startPage == 1 ? false : true;

	    next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

	  }

	  public int getTotalCount() {
	    return totalCount;
	  }

	  public int getStartPage() {
	    return startPage;
	  }

	  public int getEndPage() {
	    return endPage;
	  }

	  public boolean isPrev() {
	    return prev;
	  }

	  public boolean isNext() {
	    return next;
	  }

	  public int getDisplayPageNum() {
	    return displayPageNum;
	  }

	  public Doc_Criteria getCri() {
	    return cri;
	  }

  public String makeQuery(int page) {

	    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
	        .queryParam("perPageNum", cri.getPerPageNum()).build();

	    return uriComponents.toUriString();
	  }
	  
  /*	  
	  public String makeSearch(int page){
	    
	    UriComponents uriComponents =
	              UriComponentsBuilder.newInstance()
	              .queryParam("page", page)
	              .queryParam("perPageNum", cri.getPerPageNum())
	              .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
	              .queryParam("keyword", ((SearchCriteria)cri).getKeyword())
	              .build();             
	    
	    return uriComponents.toUriString();
	  } 
*/
}
