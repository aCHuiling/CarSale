package com.zgc.control;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zgc.manage.CustomsbillManage;
import com.zgc.model.Customsbill;

@Controller
public class CustomsControl extends BaseControl {

	@Autowired
	private CustomsbillManage custManage;
	
	
	@RequestMapping("customs/toAddCustoms")
	public String toAddCustoms(){
		return "customs/addCustoms";
	}
	
	@RequestMapping("customs/AddCustoms")
	public String AddEmployee(Customsbill cust,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isAdd=custManage.addCustomsbill(cust);
		out.print("<script>");
		if(isAdd){
			out.print("alert('添加成功！');");
			out.print("location.href='toAddCustoms';");
		}else{
			out.print("alert('添加失败！');");
			out.print("location.href='toAddCustoms';");
		}
		out.print("</script>");
		return null;
	}
	
	@RequestMapping("customs/toLookCustoms")
	public String toLookEmployee(Customsbill cust,Model model){
		List<Customsbill> custList=custManage.getAllCustomsbill(cust);
		model.addAttribute("custList",custList);
		return "customs/lookCustoms";
	}
	
	@RequestMapping("customs/toDelCustoms")
	public String toDelEmployee(Customsbill cust,Model model){
		List<Customsbill> custList=custManage.getAllCustomsbill(cust);
		model.addAttribute("custList",custList);
		return "customs/todelCustoms";
	}
	@RequestMapping("customs/DelCustoms")
	public String DelEmployee(long customsid,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isDel=custManage.delCustomsbill(new Customsbill().setCustomsid(customsid));
		out.print("<script>");
		if(isDel){
			out.print("alert('删除成功！');");
			out.print("location.href='toDelCustoms';");
		}else{
			out.print("alert('删除失败！');");
			out.print("location.href='toDelCustoms';");
		}
		out.print("</script>");
		return null;
	}
	
	
	@RequestMapping("customs/toUpdateCustoms")
	public String toUpdateEmployee(Customsbill cust,Model model){
		List<Customsbill> custList=custManage.getAllCustomsbill(cust);
		model.addAttribute("custList",custList);
		return "customs/toupdateCustoms";
	}
	@RequestMapping("customs/UpdateCustoms")
	public String UpdateEmployee(long customsid,Model model){
		Customsbill custModel=custManage.getCustomsbillByCustomsbill(new Customsbill().setCustomsid(customsid));
		model.addAttribute("custModel",custModel);
		return "customs/updateCust";
	}
	@RequestMapping("customs/UpdateCustomsT")
	public String UpdateEmployeeT(Customsbill cust,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isSu=custManage.updateCustomsbill(cust);
		out.print("<script>");
		if(isSu){
			out.print("alert('修改成功！');");
			out.print("location.href='toUpdateCustoms';");
		}else{
			out.print("alert('修改失败！');");
			out.print("location.href='UpdateCustoms';");
		}
		out.print("</script>");
		return null;
	}
}
