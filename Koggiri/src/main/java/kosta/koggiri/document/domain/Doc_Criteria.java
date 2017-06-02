package kosta.koggiri.document.domain;

public class Doc_Criteria {

	private int page;
	private int perPageNum;

	public Doc_Criteria() {
		this.page = 1; //1.기본값 페이지 번호 = 1페이지.
		this.perPageNum = 10;//2.리스트당 데이터 수 = 10 으로 강제 부여
	}

	public void setPage(int page) {

		if (page <= 0) {
			this.page = 1;
			return;
		}

		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}

		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	// method for MyBatis SQL Mapper -
	public int getPageStart() { // 시작페이지의 start값이 나옴

		return (this.page - 1) * perPageNum; //시작데이터번호 = (페이지번호-1)*페이지 당 보여지는 개수
	}

	// method for MyBatis SQL Mapper
	public int getPerPageNum() {

		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", " + "perPageNum=" + perPageNum + "]";
	}

}
