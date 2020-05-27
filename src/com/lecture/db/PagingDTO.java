package com.lecture.db;

public class PagingDTO {
	
	private int page = 1;
	private int totalCount;
	private int beginPage;
	private int endPage;
	private int displayRow = 24;
	private int displayPage = 10;
	/*private int displayRow = 24;
	private int displayPage = 10;*/
	boolean prev;
	boolean next;
	private int startNum;
	private int endNum;
	
	
	
	
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	private String[] item = {"seq","popular","recent","rating","famous"};
	
	public String[] getItem() {
		return item;
	}
	public void setItem(String[] item) {
		this.item = item;     
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		paging();
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
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	
	private void paging() {
		endPage = ((int)Math.ceil(page/(double)displayPage))*displayPage;
		System.out.println("endPage : "+endPage);
		beginPage = endPage - (displayPage-1);
		System.out.println("beginPage : "+beginPage);
		
		startNum = (page-1)*displayRow+1;
		endNum = page*displayRow;
		
		int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
		
		if(totalPage<endPage) {
			endPage = totalPage;
			next = false;
		}else {
			next = true;
		}
		prev = (beginPage == 1)?false:true;
		System.out.println("endPage : "+endPage);
		System.out.println("totalPage : "+totalPage);
	}
	
	

	
	/*public int getStartNum() {
		return startNum;
	}
	public int getEndNnum() {
	endNum = page*displayRow;
		return endNum;
	}*/
	
}
