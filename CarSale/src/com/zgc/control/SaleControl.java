package com.zgc.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.servlet.ServletUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zgc.manage.ColumnarService;
import com.zgc.manage.CustomsbillManage;
import com.zgc.manage.EmployeeManage;
import com.zgc.manage.MerchbillManage;
import com.zgc.manage.PieService;
import com.zgc.manage.SalebillManage;
import com.zgc.manage.StorebillManage;
import com.zgc.model.Customsbill;
import com.zgc.model.Employee;
import com.zgc.model.Merchbill;
import com.zgc.model.Salebill;
import com.zgc.model.Storebill;
import com.zgc.model.Userbill;
import com.zgc.tool.Tools;


@Controller
public class SaleControl extends BaseControl{

	@Autowired
	private SalebillManage salebillManage;
	@Autowired
	private StorebillManage storebillManage;
	@Autowired
	private EmployeeManage empManage;
	@Autowired
	private CustomsbillManage custManage;
	@Autowired
	private MerchbillManage merchbillManage;

	//	@RequestMapping("sale/toLookSale")
	//	public String toLookSale(Salebill sale,Model model){
	//		List<Salebill> saleList=salebillManage.getAllSalebill(sale);
	//		model.addAttribute("saleList",saleList);
	//		return "sale/lookSale";
	//	}


	@RequestMapping("sale/toAddSale")
	public String toAddSale(Salebill sale,Model model){
		List<Storebill> storeList=storebillManage.getAllStorebill(new Storebill());
		model.addAttribute("storeList",storeList);
		return "sale/addSale";
	}
	@RequestMapping("sale/ajaxMerchId")
	public String ajaxMerchId(@RequestParam("merchId")long merchId,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(merchId>0){
			boolean isExists=storebillManage.ckSaleByMerchId(new Storebill().setTomerchid(merchId));
			out.print(isExists);
		}
		out.flush();
		out.close();
		return null;
	}
	@RequestMapping("sale/ajaxId")
	public String ajaxId(@RequestParam("saleBillId")String saleBillId,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(saleBillId!=""){
			boolean isExists=salebillManage.ckSalebillBySaleId(new Salebill().setSalebillid(saleBillId));
			out.print(isExists);
		}
		out.flush();
		out.close();
		return null;
	}
	@RequestMapping("sale/ajaxEmpName")
	public String ajaxEmpName(@RequestParam("empName")String empName,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(empName!=""){
			boolean isExists=empManage.ckEmployeeByName(new Employee().setName(empName));
			out.print(isExists);
		}
		out.flush();
		out.close();
		return null;
	}
	@RequestMapping("sale/ajaxCustomName")
	public String ajaxCustomName(@RequestParam("customName")String customName,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(customName!=""){
			boolean isExists=custManage.getCustomsbillByName(new Customsbill().setCustname(customName));
			out.print(isExists);
		}
		out.flush();
		out.close();
		return null;
	}

	//添加销售信息
	@RequestMapping("sale/AddSale")
	public String AddSale(Salebill sale,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		Customsbill custModel=custManage.getCustomsbillByCustomsbill(new Customsbill().setCustname(sale.getCustomname()));
		Employee empModel=empManage.getEmployeeByEmployee(new Employee().setName(sale.getEmployeename()));
		Merchbill merchModel=merchbillManage.getMerchbillByMerchbill(new Merchbill().setVin(sale.getSalevin()));
		boolean isAdd=salebillManage.addSalebill(sale.setCustid(custModel.getCustomsid()).setSaleid(empModel.getStaffid()).setMerch(merchModel.getMerchid()));
		out.print("<script>");
		if(isAdd){
			out.print("alert('添加成功！');");
			out.print("location.href='toAddSale';");
		}else{
			out.print("alert('添加失败，库存不足！');");
			out.print("location.href='toAddSale';");
		}
		out.print("</script>");
		return null;
	}


	//更新销售信息
	@RequestMapping("sale/toUpdateSale")
	public String toUpdateSale(Salebill sale,Model model,HttpServletRequest req,HttpSession session){
		//获取当前登录系统的职工信息
		Employee empModel=(Employee) session.getAttribute("currEmpModel");
		//查询所有销售信息
		List<Salebill> saleList=salebillManage.getAllSalebillSta(sale);
		//根据当前登录系统用户查询相应的销售信息
		List<Salebill> salePeople=salebillManage.getAllSalebillSta(sale.setSaleid(empModel.getStaffid()));
		model.addAttribute("saleList",saleList);
		model.addAttribute("salePeople", salePeople);
		return "sale/toupdateSale";
	}
	@RequestMapping("sale/UpdateSale")
	public String UpdateSale(String salebillid,String customname,String employeename,Model model){//接收传过来的销售单号，销售人姓名和客户姓名
		System.out.println("customname"+customname);
		System.out.println("employeename"+employeename);
		//根据销售单号查询相应的销售信息
		Salebill saleModel=salebillManage.getSalebillBySalebill(new Salebill().setSalebillid(salebillid));
		//将传过来的客户姓名塞进saleModel
		saleModel.setCustomname(customname);
		//将传过来的销售人姓名塞进saleModel
		saleModel.setEmployeename(employeename);
		model.addAttribute("saleModel", saleModel);
		return "sale/updateSale";
	}
	@RequestMapping("sale/UpdateSaleT")
	public String UpdateSaleT(Salebill sale,HttpServletResponse resp) throws Exception{
		System.out.println("*****************修改前销售数量"+sale.getPresalenum());//页面传过来的修改前销售数量
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		//根据客户姓名获取客户信息
		Customsbill custModel=custManage.getCustomsbillByCustomsbill(new Customsbill().setCustname(sale.getCustomname()));
		//根据销售人姓名获取职工信息
		Employee empModel=empManage.getEmployeeByEmployee(new Employee().setName(sale.getEmployeename()));
		//根据销售人id、客户id和其他信息修改销售信息
		boolean isSu=salebillManage.updateSalebill(sale.setCustid(custModel.getCustomsid()).setSaleid(empModel.getStaffid()));
		out.print("<script>");
		if(isSu){
			out.print("alert('修改成功！');");
			out.print("location.href='toUpdateSale';");
		}else{
			out.print("alert('修改失败，库存不足！');");
			out.print("location.href='UpdateSale';");
		}
		out.print("</script>");
		return null;
	}

	//删除销售信息
	@RequestMapping("sale/toDelSale")
	public String toDelSale(Salebill sale,Model model,HttpServletRequest req,HttpSession session){
		//获取当前登录系统的职工信息
		Employee empModel=(Employee) session.getAttribute("currEmpModel");
		//查询所有销售信息
		List<Salebill> saleList=salebillManage.getAllSalebillSta(sale);
		//根据当前登录系统用户查询相应的销售信息（销售员只能修改、删除和查看自己的销售信息，销售经理可以修改、删除和查看所有的销售信息）
		List<Salebill> salePeople=salebillManage.getAllSalebillSta(sale.setSaleid(empModel.getStaffid()));
		model.addAttribute("saleList",saleList);
		model.addAttribute("salePeople", salePeople);
		return "sale/todelSale";
	}
	@RequestMapping("sale/DelSale")
	public String toDelSale(String salebillid,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isDel=salebillManage.delSalebill(new Salebill().setSalebillid(salebillid));
		out.print("<script>");
		if(isDel){
			out.print("alert('删除成功！');");
			out.print("location.href='toDelSale';");
		}else{
			out.print("alert('删除失败！');");
			out.print("location.href='toDelSale';");
		}
		out.print("</script>");
		return null;
	}

	//查询所有销售信息
	@RequestMapping("sale/toLookSale")
	public String toLookSale(Salebill sale,Model model,HttpServletRequest req,HttpSession session) throws ParseException{
		double saleCount = 0;
		double profitCount = 0;
		//获取当前登录系统的职工信息
		Employee empUser=(Employee) session.getAttribute("currEmpModel");
		//获取当前登录系统的用户信息
		Userbill userModel=(Userbill) session.getAttribute(Tools.CRRUSER);
		//查询所有销售信息
		List<Salebill> saleStaList=salebillManage.getAllSalebillSta(sale);
		//查询没有分页的所有销售信息
		List<Salebill> saleList=salebillManage.getallSalebillNotPage(sale);
		//根据当前登录系统用户查询相应的销售信息（销售员只能修改、删除和查看自己的销售信息，销售经理可以修改、删除和查看所有的销售信息）
		List<Salebill> salePeople=salebillManage.getAllSalebillSta(sale.setSaleid(empUser.getStaffid()));
		if(Integer.parseInt(userModel.getIsmanage())==3){//当登录系统的是销售员时
			for(Salebill s:salePeople){
				saleCount +=s.getMerchbill().getUnitcost()*s.getSalenum();
				profitCount +=(s.getMerchbill().getUnitcost()-s.getImportbill().getImportprice())*s.getSalenum();
			}
			System.out.println("saleCount:"+saleCount);
			System.out.println("profitCount:"+profitCount);
			model.addAttribute("saleCount",saleCount);
			model.addAttribute("profitCount",profitCount);
			model.addAttribute("salePeople", salePeople);//塞登录系统是销售员的销售信息
			return "sale/lookSale";
		}else {
			for(Salebill s:saleList){
				saleCount +=s.getMerchbill().getUnitcost()*s.getSalenum();
				profitCount +=(s.getMerchbill().getUnitcost()-s.getImportbill().getImportprice())*s.getSalenum();
			}
			System.out.println("saleCount:"+saleCount);
			System.out.println("profitCount:"+profitCount);
			model.addAttribute("saleCount",saleCount);
			model.addAttribute("profitCount",profitCount);
			model.addAttribute("saleStaList", saleStaList);//塞所有销售信息
			return "sale/lookSale";
		}
	}


	//根据销售人姓名查询所有销售信息（如果姓名为空时进页面会为空，所以分开两个方法查询）
	@RequestMapping("sale/LookSale")
	public String LookSale(Salebill sale,Model model) throws ParseException{
		double saleCount = 0;
		double profitCount = 0;
		if(sale.getSalename()!=""){//首先要确定输入的销售人信息不为空
			//根据输入的销售人姓名获取职工信息
			Employee empModel=empManage.getEmployeeByEmployee(new Employee().setName(sale.getSalename()));
			//根据职工信息获取的销售人id（saleid）来获取相应的销售信息
			List<Salebill> saleStaList=salebillManage.getAllSalebillByName(sale.setSaleid(empModel.getStaffid()));
			//没有分页的情况下根据销售人姓名获取销售信息
			List<Salebill> saleList=salebillManage.getallSalebillNotPage(sale.setSaleid(empModel.getStaffid()));
			for(Salebill s:saleList){
				saleCount +=s.getMerchbill().getUnitcost()*s.getSalenum();
				profitCount +=(s.getMerchbill().getUnitcost()-s.getImportbill().getImportprice())*s.getSalenum();
			}
			System.out.println("saleCount:"+saleCount);
			System.out.println("profitCount:"+profitCount);
			model.addAttribute("saleCount",saleCount);
			model.addAttribute("profitCount",profitCount);
			model.addAttribute("saleStaList", saleStaList);
			model.addAttribute("lead","销售人为");
			model.addAttribute("dateOrWho",sale.getSalename());
			return "sale/lookSale";
		}
		return "sale/lookSale";
	}


	//按日期查询销售信息
	@RequestMapping("sale/SelectStatistics")
	public String SelectStatistics1(Salebill sale,Model model,HttpSession session) throws ParseException{
		if(sale.getSaledates()!=""){
			double saleCount = 0;
			double profitCount = 0;
			//获取当前登录系统的职工信息
			Employee empUser=(Employee) session.getAttribute("currEmpModel");
			//获取当前登录系统的用户信息
			Userbill userModel=(Userbill) session.getAttribute(Tools.CRRUSER);
			//根据日期查询销售信息
			List<Salebill> saleStaList=salebillManage.getAllSalebillByDate(sale);
			//没有分页的情况下根据日期查询销售信息（用于统计总销售额和总盈利额）
			List<Salebill> saleList=salebillManage.getallSalebillNotPage(sale);
			//根据当前登录系统用户查询相应的销售信息（销售员只能修改、删除和查看自己的销售信息，销售经理可以修改、删除和查看所有的销售信息）
			List<Salebill> salePeople=salebillManage.getAllSalebillByDate(sale.setSaleid(empUser.getStaffid()));
			if(Integer.parseInt(userModel.getIsmanage())==3){//当登录系统的是销售员时
				for(Salebill s:salePeople){//salePeople
					saleCount +=s.getMerchbill().getUnitcost()*s.getSalenum();
					profitCount +=(s.getMerchbill().getUnitcost()-s.getImportbill().getImportprice())*s.getSalenum();
				}
				model.addAttribute("saleCount",saleCount);
				model.addAttribute("profitCount",profitCount);
				model.addAttribute("salePeople", salePeople);
				model.addAttribute("lead","销售日期为");
				model.addAttribute("dateOrWho",sale.getSaledates());
				return "sale/lookSale";
			}else{
				for(Salebill s:saleList){//当登录系统的是销售经理时saleList
					saleCount +=s.getMerchbill().getUnitcost()*s.getSalenum();
					profitCount +=(s.getMerchbill().getUnitcost()-s.getImportbill().getImportprice())*s.getSalenum();
				}
				model.addAttribute("saleCount",saleCount);
				model.addAttribute("profitCount",profitCount);
				model.addAttribute("saleStaList", saleStaList);
				model.addAttribute("lead","销售日期为");
				model.addAttribute("dateOrWho",sale.getSaledates());
				return "sale/lookSale";
			}
		}else{
			return "sale/lookSale";
		}
	}


	//跳转到销售信息盘点界面
	@RequestMapping("sale/Statistics")
	public String Statistics(){
		return "sale/statistics";
	}

	//统计图（柱状图）
	@Autowired
	private ColumnarService columnarService;
	//按年统计
	@RequestMapping(value = "getColumnChart.year")
	public ModelAndView getColumnChartYear(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) throws Exception {
		// 在业务层获取创建的柱状图（此时柱状图已经创建完成的）
		JFreeChart chart = columnarService.createColumnarTools();
		// 将图形转换为图片传到dateSet.jsp
		String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400,
				null, request.getSession());
		String chartURL = request.getContextPath() + "/chart?filename="
				+ fileName;
		modelMap.put("chartColumnURL", chartURL);
		return new ModelAndView("sale/statistics", modelMap);
	}
	//按当年月份统计
	@RequestMapping(value = "getColumnChart.month")
	public ModelAndView getColumnChartMonth(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) throws Exception {
		// 在业务层获取创建的柱状图（此时柱状图已经创建完成的）
		JFreeChart chart = columnarService.createColumnarTools2();
		// 将图形转换为图片传到dateSet.jsp
		String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400,
				null, request.getSession());
		String chartURL = request.getContextPath() + "/chart?filename="
				+ fileName;
		modelMap.put("chartColumnURL", chartURL);
		return new ModelAndView("sale/statistics", modelMap);
	}
	//按销售人姓名统计
	@RequestMapping(value = "getColumnChart.name")
	public ModelAndView getColumnChartName(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) throws Exception {
		// 在业务层获取创建的柱状图（此时柱状图已经创建完成的）
		JFreeChart chart = columnarService.createColumnarTools3();
		// 将图形转换为图片传到dateSet.jsp
		String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400,
				null, request.getSession());
		String chartURL = request.getContextPath() + "/chart?filename="
				+ fileName;
		modelMap.put("chartColumnURL", chartURL);
		return new ModelAndView("sale/statistics", modelMap);
	}
	//按销售车辆类别和性别统计
	@RequestMapping(value = "getColumnChart.kind")
	public ModelAndView getColumnChartKind(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) throws Exception {
		// 在业务层获取创建的柱状图（此时柱状图已经创建完成的）
		JFreeChart chart = columnarService.createColumnarTools4();
		// 将图形转换为图片传到dateSet.jsp
		String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400,
				null, request.getSession());
		String chartURL = request.getContextPath() + "/chart?filename="
				+ fileName;
		modelMap.put("chartColumnURL", chartURL);
		return new ModelAndView("sale/statistics", modelMap);
	}





	@Autowired
	private PieService pieService;

	@RequestMapping(value = "getPieChart.do")
	public ModelAndView getPieChart(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) throws Exception {
		JFreeChart chart = pieService.createPieTools();
		// 将图形转换为图片传到dateSet.jsp
		String fileName = ServletUtilities.saveChartAsJPEG(chart, 700, 400,
				null, request.getSession());
		String chartURL = request.getContextPath() + "/chart?filename="
				+ fileName;
		modelMap.put("chartPieURL", chartURL);
		return new ModelAndView("sale/statistics", modelMap);
	} 

}
