package com.zgc.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.zgc.manage.MerchbillManage;
import com.zgc.manage.ProfferbillManage;
import com.zgc.model.Merchbill;
import com.zgc.model.Profferbill;
import com.zgc.model.Storebill;

@Controller
public class MerchControl extends BaseControl {
	
	@Autowired
	private MerchbillManage merchbillManage;
	@Autowired
	private ProfferbillManage profferbillManage;

	//查看车辆信息
	@RequestMapping("merch/toLookMerch")
	public String toLookMerch(Model model,Merchbill merch){
		List<Merchbill> merchbillList=merchbillManage.getAllMerchbill(merch);
		model.addAttribute("merchbillList",merchbillList);
		return "merch/lookMerch";
	}
	
	
	//删除车辆信息
	@RequestMapping("merch/toDelMerch")
	public String toDelMerch(Model model,Merchbill merch){
		List<Merchbill> merchbillList=merchbillManage.getAllMerchbill(merch);
		model.addAttribute("merchbillList",merchbillList);
		return "merch/todelMerch";
	}
	@RequestMapping("merch/DelMerch")
	public String DelMerch(long merchid,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isDel=merchbillManage.delMerchbill(new Merchbill().setMerchid(merchid).setStatus("0"));
		out.print("<script>");
		if(isDel){
			out.print("alert('删除成功！');");
			out.print("location.href='toDelMerch';");
		}else{
			out.print("alert('删除失败！');");
			out.print("location.href='toDelMerch';");
		}
		out.print("</script>");
		return null;
	}
	
	
	@RequestMapping("merch/toAddMerch")
	//获取所有供货商号
	public String toAddMerch(Model model,Profferbill proffer){
		List<Profferbill> profferList=profferbillManage.getAllProfferId(proffer);
		model.addAttribute("profferList",profferList);
		return "merch/addMerch";
	}
	
	//添加车辆信息
	@RequestMapping("merch/AddMerch")
	public String AddMerch(Model model,Merchbill merch,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isAdd=merchbillManage.addMerchbill(merch);
		out.print("<script>");
		if(isAdd){
			out.print("alert('添加成功！');");
			out.print("location.href='toAddMerch';");
		}else{
			out.print("alert('添加失败！');");
			out.print("location.href='toAddMerch';");
		}
		out.print("</script>");
		return null;
	}
	
	
	@RequestMapping("merch/toUpdateMerch")
	public String toUpdateMerch(Model model,Merchbill merch){
		List<Merchbill> merchbillList=merchbillManage.getAllMerchbill(merch);
		model.addAttribute("merchbillList",merchbillList);
		return "merch/toupdateMerch";
	}
	@RequestMapping("merch/UpdateMerch")
	public String UpdateMerch(long merchid,Model model){
		Merchbill merchModel=merchbillManage.getMerchbillByMerchbill(new Merchbill().setMerchid(merchid));
		model.addAttribute("merchModel",merchModel);
		return "merch/updateMerch";
	}
	@RequestMapping("merch/UpdateMerchT")
	public String UpdateMerchT(Merchbill merch,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isSu=merchbillManage.updateMerchbill(merch);
		out.print("<script>");
		if(isSu){
			out.print("alert('修改成功！');");
			out.print("location.href='toUpdateMerch';");
		}else{
			out.print("alert('修改失败！');");
			out.print("location.href='UpdateMerch';");
		}
		out.print("</script>");
		return null;
	}
	
	@RequestMapping("merch/ajaxEnginenumber")
	public String ajaxEnginenumber(@RequestParam("enginenumber")String enginenumber,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(enginenumber!=""){
			boolean isExists=merchbillManage.ckMerchByEnginenumber(new Merchbill().setEnginenumber(enginenumber));
			out.print(isExists);
		}
		out.flush();
		out.close();
		return null;
	}
	
	
	@RequestMapping("merch/ajaxVin")
	public String ajaxVin(@RequestParam("vin")String vin,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(vin!=""){
			boolean isExists=merchbillManage.ckMerchByVin(new Merchbill().setVin(vin));
			out.print(isExists);
		}
		out.flush();
		out.close();
		return null;
	}
}
