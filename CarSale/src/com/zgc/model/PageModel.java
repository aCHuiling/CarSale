package com.zgc.model;

public class PageModel extends BaseModel{
	private int totalCount;
	private int totalPage;
	private int currPage;
	private int pageSize=5;
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		if(totalCount>0){
			this.totalPage=totalCount%pageSize==0?(totalCount/pageSize):totalCount/pageSize+1;
		}else
			totalPage=1;
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	

}
