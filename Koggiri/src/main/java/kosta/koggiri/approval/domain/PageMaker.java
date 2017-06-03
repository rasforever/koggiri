package kosta.koggiri.approval.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int displayPageNum = 10;

	private ApprovalSearchVO search;

	public ApprovalSearchVO getSearch() {
		return search;
	}

	public void setSearch(ApprovalSearchVO search) {
		this.search = search;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		calcData();
	}

	private void calcData() {

		endPage = (int) (Math.ceil(search.getPage() / (double) displayPageNum) * displayPageNum);

		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) search.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;

		next = endPage * search.getPerPageNum() >= totalCount ? false : true;

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

	public String makeQuery(int page) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", search.getPerPageNum()).build();

		return uriComponents.toUriString();
	}

	public String makeSearch(int page) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", search.getPerPageNum())
				.queryParam("searchType", ((ApprovalSearchVO) search).getSearchType())
				.queryParam("app_pro_cd", encoding(((ApprovalSearchVO) search).getApp_pro_cd()))
				.queryParam("search_app_id", encoding(((ApprovalSearchVO) search).getSearch_app_id()))
				.queryParam("app_type", encoding(((ApprovalSearchVO) search).getApp_type()))
				.queryParam("dept_cd", encoding(((ApprovalSearchVO) search).getDept_cd()))
				.queryParam("draft_emp_id", encoding(((ApprovalSearchVO) search).getDraft_emp_id()))
				.queryParam("app_emp_id", encoding(((ApprovalSearchVO) search).getApp_emp_id()))
				.queryParam("draft_s_dt", encoding(((ApprovalSearchVO) search).getDraft_s_dt()))
				.queryParam("draft_e_dt", encoding(((ApprovalSearchVO) search).getDraft_e_dt())).build();

		return uriComponents.toUriString();
	}

	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}

		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
}
