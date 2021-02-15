package com.bc.common.mybatis;

public class Page {
	private int nowPage = 1;		//현재페이지
	private int nowBlock = 1;		//현재 블록(페이지 담는 단위)
	
	private int pageUnit = 8;		//블록당 표시하는 페이지 갯수
	private int pageSize = 8;		//한 페이지당 보여지는 게시물수

	private int totalRecord = 0;	//총 게시물 수
	private int totalPage = 0; 		//전체 페이지 갯수
	private int totalBlock = 0; 	//전체 블록 갯수
	
	private int begin = 0; 			//현재 페이지상의 시작 글번호
	private int end = 0; 			//현재 페이지상의 마지막 글번호
	
	private int beginPage = 0; 		//현재 블록의 시작 페이지 번호
	private int endPage = 0; 		//현재 블록의 끝 페이지 번호	
	
	public Page() {}
	
	// 페이징 처리
	public void setTotalPage() {
		totalPage = totalRecord / pageSize;
		if (totalRecord % pageSize > 0) totalPage++;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "Page [nowPage=" + nowPage + ", nowBlock=" + nowBlock + ", pageUnit=" + pageUnit + ", pageSize="
				+ pageSize + ", totalRecord=" + totalRecord + ", totalPage=" + totalPage + ", totalBlock=" + totalBlock
				+ ", begin=" + begin + ", end=" + end + ", beginPage=" + beginPage + ", endPage=" + endPage + "]";
	}
	
}
	
		
	