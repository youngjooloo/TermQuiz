package com.termquiz.team.common;


import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageNation {
    
	private int rowsPerPage; 
	private int currPage;    
	private int sno;
	private int eno;
	private int totalRowsCount; 
	private int spageNo; 
	private int epageNo; 
	private int displayPageNo=5; 
	private int lastPageNo; 
	private boolean prev; 
	private boolean next; 
	private String searchType;
	private String keyword;
	
	private String sortName;
	
	public PageNation() {
		this.rowsPerPage = 10;
		this.currPage = 1;
	}
	
	public void setCurrPage(int currPage) {
		if (currPage > 1)
			this.currPage = currPage;
		else
			this.currPage = 1;
	}

	public void setRowsPerPage(int rowsPerPage) {
		if (rowsPerPage > 5 && rowsPerPage <= 50)
			this.rowsPerPage = rowsPerPage;
		else
			this.rowsPerPage = 5;
	}

	public void setSnoEno() {
		if (this.sno < 1)
			this.sno = 1;
		// this.sno=(this.currPage-1)*this.rowsPerPage + 1 ; -> Oracle
		this.sno = (this.currPage - 1) * this.rowsPerPage; // MySql

	}// criteria

	// 2) totalRowCount
	public void setTotalRowsCount(int totalRowsCount) {
		this.totalRowsCount = totalRowsCount;
		calcData();
	}

	public void calcData() {

		epageNo = (int) Math.ceil(currPage / (double) displayPageNo) * displayPageNo;
		spageNo = (epageNo - displayPageNo) + 1;

		// 3.2) lastPageNo 계산, epageNo 확인
		lastPageNo = (int) Math.ceil(totalRowsCount / (double) rowsPerPage);
		if (epageNo > lastPageNo)
			epageNo = lastPageNo;

		// 3.3) prev, next
		prev = spageNo == 1 ? false : true;
		next = epageNo == lastPageNo ? false : true;
	} // calcData

	public String makeQuery(int currPage) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("currPage", currPage)
				.queryParam("rowsPerPage", rowsPerPage).build();
		return uriComponents.toString();
	} // makeQuery

	public String searchQuery(int currPage) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("currPage", currPage)
				.queryParam("rowsPerPage", rowsPerPage).queryParam("searchType", searchType)
				.queryParam("keyword", keyword).build();
		return uriComponents.toString();
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

  }//common


	
	
	
	
	
	
	

