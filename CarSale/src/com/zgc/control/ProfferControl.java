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

import com.zgc.manage.ProfferbillManage;
import com.zgc.model.Profferbill;

@Controller
public class ProfferControl extends BaseControl {
	
	@Autowired
	private ProfferbillManage profferbillManage;

	
	//跳转添加供货商界面
	@RequestMapping("proffer/toAddProffer")
	public String toAddProffer(){
		return "proffer/addProffer";
	}
	
	//ajax验证供货商号是否存在
	@RequestMapping("manage/ajaxCkId")
	public String ajaxCkId(@RequestParam("profferId")String profferId,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(profferId!=""){
			boolean isExists=profferbillManage.ckProfferId(profferId);
			out.print(isExists);
			}
			out.flush();
			out.close();
			return null;
	}
	
	
	//添加供货商
	@RequestMapping("proffer/AddProffer")
	public String AddProffer(Profferbill proffer,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isAdd=profferbillManage.addProfferbill(proffer);
		out.print("<script>");
		if(isAdd){
			out.print("alert('添加成功！');");
			out.print("location.href='toAddProffer';");
		}else{
			out.print("alert('添加失败！');");
			out.print("location.href='toAddProffer';");
		}
		out.print("</script>");
		return null;
	}
	
	//查看所有供货商信息
	@RequestMapping("proffer/toLookProffer")
	public String toLookProffer(Model model,Profferbill proffer){
		List<Profferbill> profferList=profferbillManage.getAllProfferbill(proffer);
		model.addAttribute("profferList",profferList);
		return "proffer/lookProffer";
	}
	
	
	//修改供货商信息
	@RequestMapping("proffer/toUpdateProffer")
	public String toUpdateProffer(Model model,Profferbill proffer){
		List<Profferbill> profferList=profferbillManage.getAllProfferbill(proffer);
		model.addAttribute("profferList",profferList);
		return "proffer/toupdateProffer";
	}
	@RequestMapping("proffer/UpdateProffer")
	public String UpdateProffer(String profferid,Model model){
		Profferbill profferModel=profferbillManage.getProfferbillByProfferbill(new Profferbill().setProfferid(profferid));
		model.addAttribute("profferModel",profferModel);
		return "proffer/updateProffer";
	}
	@RequestMapping("proffer/UpdateProfferT")
	public String UpdateProfferT(Profferbill proffer,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isSu=profferbillManage.updateProfferbill(proffer);
		out.print("<script>");
		if(isSu){
			out.print("alert('修改成功！');");
			out.print("location.href='toUpdateProffer';");
		}else{
			out.print("alert('修改失败！');");
			out.print("location.href='UpdateProffer';");
		}
		out.print("</script>");
		return null;
	}
	
	//删除供货商信息
	@RequestMapping("proffer/toDelProffer")
	public String toDelProffer(Model model,Profferbill proffer){
		List<Profferbill> profferList=profferbillManage.getAllProfferbill(proffer);
		model.addAttribute("profferList",profferList);
		return "proffer/todelProffer";
	}
	@RequestMapping("proffer/DelProffer")
	public String DelProffer(String profferid,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isDl=profferbillManage.delProfferbill(new Profferbill().setProfferid(profferid).setStatus("0"));
		out.print("<script>");
		if(isDl){
			out.print("alert('删除成功！');");
			out.print("location.href='toDelProffer';");
		}else{
			out.print("alert('删除失败！');");
			out.print("location.href='toDelProffer';");
		}
		out.print("</script>");
		return null;
	}
}
