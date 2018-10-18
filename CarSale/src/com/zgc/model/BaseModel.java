package com.zgc.model;

import java.io.Serializable;


public class BaseModel implements Serializable{
	private String countsql;
	private String pageSql;
	private PageModel pageModel;
	
	public PageModel getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}
	public String getCountsql() {
		return countsql;
	}
	public void setCountsql(String countsql) {
		this.countsql = countsql;
	}
	public String getPageSql() {
		return pageSql;
	}
	public void setPageSql(String pageSql) {
		this.pageSql = pageSql;
	}
	

}
