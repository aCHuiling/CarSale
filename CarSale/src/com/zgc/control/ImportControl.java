package com.zgc.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.zgc.manage.ImportbillManage;
import com.zgc.manage.MerchbillManage;
import com.zgc.model.Importbill;
import com.zgc.model.Merchbill;

@Controller
public class ImportControl extends BaseControl {

	@Autowired
	private ImportbillManage importbillManage;
	@Autowired
	private MerchbillManage merchbillManage;
	
	
	//查询所有进货信息
	@RequestMapping("import/lookImport")
	public String lookImport(Importbill imp,Model model){
		List<Importbill> importList=importbillManage.getAllImportbill(imp);
		model.addAttribute("importList",importList);
		return "import/lookImport";
	}
	
	//跳转到添加进货信息界面
	@RequestMapping("import/toAddImport")
	public String toAddImport(Merchbill merch,Model model){
		//查询所有车辆编号
		List<Merchbill> merchbillList=merchbillManage.getAllMerchbillId(merch);
		model.addAttribute("merchbillList",merchbillList);
		return "import/addImport";
	}
	
	//ajax计算进货总金额
	@ResponseBody
	@RequestMapping("import/ajaxCkCount")
	public String ajaxCkCount(@RequestParam("importPrice")String importPrice,@RequestParam("quantity")String quantity,HttpServletResponse resp,Model model){
		resp.setContentType("text/html;charset=utf-8");
		if(importPrice!=""&&quantity!=""){
            double totalmoney=Double.parseDouble(importPrice)*Integer.parseInt(quantity);
            System.out.println("********************进货总金额："+totalmoney);
			Map<String,Object> impmodel=new HashMap<String, Object>();
			if(totalmoney>0)
				impmodel.put("totalmoney", totalmoney);
			return JSONArray.toJSONString(impmodel);
		}
		return null;
	}
	@RequestMapping("import/ajaxId")
	public String ajaxId(@RequestParam("importId")String importId,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(importId!=""){
			boolean isExists=importbillManage.getImportbillByImportbill(new Importbill().setImportbillid(importId))!=null;
			out.print(isExists);
		}
		out.flush();
		out.close();
		return null;
	}
	
	
	@RequestMapping("import/AddImport")
	public String AddImport(Importbill imp,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isAdd=importbillManage.addImportbill(imp);
		out.print("<script>");
		if(isAdd){
			out.print("alert('添加成功！');");
			out.print("location.href='toAddImport';");
		}else{
			out.print("alert('添加失败！');");
			out.print("location.href='toAddImport';");
		}
		out.print("</script>");
		return null;
	}
	
	
	@RequestMapping("import/toDelImport")
	public String toDelImport(Importbill imp,Model model){
		List<Importbill> importList=importbillManage.getAllImportbill(imp);
		model.addAttribute("importList",importList);
		return "import/todelImport";
	}
	@RequestMapping("import/DelImport")
	public String DelImport(String importbillid,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isDel=importbillManage.delImportbill(new Importbill().setImportbillid(importbillid));
		out.print("<script>");
		if(isDel){
			out.print("alert('删除成功！');");
			out.print("location.href='toDelImport';");
		}else{
			out.print("alert('删除失败！');");
			out.print("location.href='toDelImport';");
		}
		out.print("</script>");
		return null;
	}
	
	@RequestMapping("import/toUpdateImport")
	public String toUpdateImport(Importbill imp,Model model){
		List<Importbill> importList=importbillManage.getAllImportbill(imp);
		model.addAttribute("importList",importList);
		return "import/toupdateImport";
	}
	@RequestMapping("import/UpdateImport")
	public String UpdateImport(Importbill imp,String importbillid,String merchname,Model model,Merchbill merch){
		Importbill impModel=importbillManage.getImportbillByImportbill(new Importbill().setImportbillid(importbillid));
		impModel.setMerchname(merchname);
		model.addAttribute("impModel", impModel);
		return "import/updateImport";
	}
	@RequestMapping("import/UpdateImportT")
	public String UpdateImportT(Importbill imp,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isSu=importbillManage.updateImportbill(imp);
		out.print("<script>");
		if(isSu){
			out.print("alert('修改成功！');");
			out.print("location.href='toUpdateImport';");
		}else{
			out.print("alert('修改失败！');");
			out.print("location.href='UpdateImport';");
		}
		out.print("</script>");
		return null;
	}
	
}
