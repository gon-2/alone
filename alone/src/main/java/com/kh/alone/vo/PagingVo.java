package com.kh.alone.vo;

public class PagingVo {
	private static final int PAGE_BLOCK = 10;
	private int page = 1;
	private int startRow = 1;
	private int endRow = 10;
	private int startPage = 1;
	private int endPage = 10;
	private int count;
	private int totalPage;
	private int perPage = 10;
	private String searchType;
	private String keyword;

	public PagingVo() {
		super();
	}

	public void setPageInfo() {
		this.endRow = this.page * perPage;
		this.startRow = this.endRow - (perPage - 1);
		this.startPage = (this.page - 1) / PAGE_BLOCK * PAGE_BLOCK + 1;
		this.endPage = this.startPage + (PAGE_BLOCK - 1);
		
		this.totalPage = (this.count / perPage) + ((this.count % perPage) > 0 ? 1 : 0);
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}

	
	public PagingVo (int page, int startRow, int endRow, int startPage, int endPage, int count, int totalPage,
			int perPage, String searchType, String keyword) {
		super();
		this.page = page;
		this.startRow = startRow;
		this.endRow = endRow;
		this.startPage = startPage;
		this.endPage = endPage;
		this.count = count;
		this.totalPage = totalPage;
		this.perPage = perPage;
		this.searchType = searchType;
		this.keyword = keyword;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		
		
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getPerPage() {
		return perPage;
	}


	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

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
		return "PagingVo [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", count=" + count + ", totalPage=" + totalPage + ", perPage=" + perPage
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
