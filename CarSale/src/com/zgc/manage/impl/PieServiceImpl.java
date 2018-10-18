package com.zgc.manage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.beans.factory.annotation.Autowired;

import com.zgc.manage.PieService;
import com.zgc.manage.SalebillManage;
import com.zgc.model.Salebill;
import com.zgc.tool.PieTools;

public class PieServiceImpl implements PieService {
	
	@Autowired
	private SalebillManage salebillManage;
	/**
	 * 从饼状图工具类里面获取创建的Columnar柱状图
	 */
	public JFreeChart createPieTools() {
	    // TODO Auto-generated method stub
	    // 获取饼状图的数据集
	    DefaultPieDataset dataset = getDataSet();
	    // 获取饼状图工具类创建的饼状图
	    JFreeChart chart = PieTools.createPie(dataset);
	    return chart;
	}

	/**
	 * 添加饼状图的数据
	 * 
	 * @return
	 */
	public DefaultPieDataset getDataSet() {
	    // 数据可以从数据库中得到
	    DefaultPieDataset dataset = new DefaultPieDataset();
	    // 添加数据
	    List<Salebill> saleList=salebillManage.getSalebillBySex(new Salebill());
	    int countman=0;
	    int countwoman=0;
	    for(Salebill s:saleList){
	     if(s.getCustsex().equals("男")){
	    	 countman++;
	     }else{
	    	 countwoman++;
	     }
	    }
	    Map<String, Integer> map=new HashMap<String, Integer>();
	    map.put("男", countman);
	    map.put("女", countwoman);
	    Double sum = 0.0;
	    int count = map.size();
	    Set<String> keys = map.keySet();
	    for (String key : keys) {
	        sum += sum + map.get(key);

	    }
	    for (String key : keys) {

	        dataset.setValue(key, map.get(key));
	    }
	    // dataset.setValue("张三",30);
	    // dataset.setValue("李四",12);
	    // dataset.setValue("李四",12);
	    // dataset.setValue("王六",10);

	    return dataset;
	}
}
