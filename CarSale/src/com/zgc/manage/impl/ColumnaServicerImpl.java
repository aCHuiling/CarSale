package com.zgc.manage.impl;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.jfree.chart.JFreeChart;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.factory.annotation.Autowired;

import com.zgc.manage.ColumnarService;
import com.zgc.manage.SalebillManage;
import com.zgc.model.Salebill;
import com.zgc.tool.ColumnarTools;

public class ColumnaServicerImpl implements ColumnarService {
	
	@Autowired
	private SalebillManage salebillManage;

	//从柱状图工具类里面获取创建的Columnar柱状图

	public JFreeChart createColumnarTools() {
	    // TODO Auto-generated method stub
	    // 获得数据
	    CategoryDataset dataset = getDataSet(null);
	    // 获取柱状图工具类创建的柱状图，（将数据集传入）
	    JFreeChart chart = ColumnarTools.createCoColumnar(dataset);
	    return chart;
	}
	public JFreeChart createColumnarTools2() {
		// TODO Auto-generated method stub
		CategoryDataset dataset = getDataSet2(null);
	    // 获取柱状图工具类创建的柱状图，（将数据集传入）
	    JFreeChart chart = ColumnarTools.createCoColumnar(dataset);
	    return chart;
	}
	public JFreeChart createColumnarTools3() {
		// TODO Auto-generated method stub
		CategoryDataset dataset = getDataSet3(null);
	    // 获取柱状图工具类创建的柱状图，（将数据集传入）
	    JFreeChart chart = ColumnarTools.createCoColumnar(dataset);
	    return chart;
	}
	public JFreeChart createColumnarTools4() {
		// TODO Auto-generated method stub
		CategoryDataset dataset = getDataSet4(null);
	    // 获取柱状图工具类创建的柱状图，（将数据集传入）
	    JFreeChart chart = ColumnarTools.createCoColumnar(dataset);
	    return chart;
	}
	
	
	
	
	

	 //获取一个演示用的组合数据集对象 为柱状图添加数据

	public CategoryDataset getDataSet(HttpSession session) {
	    // 数据可以从数据库中得到
	    DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	    List<Salebill> saleList=salebillManage.getSalebillByYear(new Salebill());
	    System.out.println("****************"+saleList.size());
	    for(Salebill s:saleList){
	    	dataset.addValue(s.getSaletotal(), "年度", s.getYear()+"年");
	    }
	    return dataset;
	}
	
	public CategoryDataset getDataSet2(HttpSession session) {
	    // 数据可以从数据库中得到
	    DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	    List<Salebill> saleList=salebillManage.getSalebillByMonth(new Salebill());
	    for(Salebill s:saleList){
	    	dataset.addValue(s.getSaletotal(), "按月", s.getNowyear()+"年"+s.getMoth()+"月");
	    }
	    return dataset;
	}
	
	public CategoryDataset getDataSet3(HttpSession session) {
	    // 数据可以从数据库中得到
	    DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	    List<Salebill> saleList=salebillManage.getSalebillByName(new Salebill());
	    for(Salebill s:saleList){
	    	dataset.addValue(s.getSaletotal(), "销售人/年",s.getSalename());
	    }
	    return dataset;
	}

	public CategoryDataset getDataSet4(HttpSession session) {
	    // 数据可以从数据库中得到
	    DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	    //获取销售的车辆类别
	    List<Salebill> saleListKind=salebillManage.getSalebillByGroup(new Salebill());
	    //获取销售的客户性别和车辆类别
	    List<Salebill> saleList=salebillManage.getSalebillByKind(new Salebill());
	    String merchkind = null;
	    int countman=0;
	    int countwoman=0;
	    for(Salebill k:saleListKind){
	    	for(Salebill s:saleList){
	    		if(s.getMerchkind().equals(k.getMerchkind())){
	    			merchkind=s.getMerchkind();
	    			if(s.getCustsex().equals("男")){
	    				countman++;
	    			}else{
	    				countwoman++;
	    			}
	    		}
	    	}
	    	dataset.addValue(countwoman, "女",merchkind);
	    	dataset.addValue(countman, "男",merchkind);

	    	countman=0;
		    countwoman=0;
	    }
	    return dataset;
	}

}
