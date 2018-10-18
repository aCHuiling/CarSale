package com.zgc.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zgc.manage.RoleFuncManage;
import com.zgc.manage.SysFunctionManage;
import com.zgc.manage.SysRoleManage;
import com.zgc.model.RoleFunc;
import com.zgc.model.SysFunction;
import com.zgc.model.SysRole;
import com.zgc.model.Userbill;
import com.zgc.tool.Tools;

@Controller
public class RoleControl extends BaseControl{
	
	@Autowired
	private SysRoleManage sysRoleManage;
	@Autowired
	private SysFunctionManage sysFunctionManage;
	@Autowired
	private RoleFuncManage roleFuncManage;
	

	//查询所有系统角色
	@RequestMapping("manage/RoleList")
	public String roleList(SysRole role,Model model){
		List<SysRole> roleList=sysRoleManage.getAllSysRole(role);
		model.addAttribute("roleList",roleList);
		return "manage/roleList";
	}
	
	//修改系统角色
	@RequestMapping("manage/toUpdateRole")
	public String toUpdateRole(SysRole role,Model model){
		SysRole roleModel=sysRoleManage.getSysRoleBySysRole(role);
		model.addAttribute("roleModel",roleModel);
//		//获取所有状态为1的系统功能
//		List<SysFunction> funList=sysFunctionManage.getAllSysFunction(new SysFunction().setStatus("1"));
//		//获取所有状态为1、roleid和系统角色表SysRole的rowid相等的系统角色表信息
//		List<RoleFunc> mdFuncRoles=roleFuncManage.getAllRoleFunc(new RoleFunc().setStatus("1").setRoleid(roleModel.getRowid()));
//		model.addAttribute("funList",funList);
//		model.addAttribute("mdFuncRoles", mdFuncRoles);
		return "manage/updateRole";
		
	}
	
	//修改系统角色
	@RequestMapping("manage/UpdateRole")
	public String updateRole(SysRole role,HttpServletResponse response,HttpSession session) throws Exception{
		Userbill userbill=(Userbill)session.getAttribute(Tools.CRRUSER);
		role.setLast_upd_by(userbill.getRowid());
		boolean isSu=sysRoleManage.updateSysRole(role);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print("<script>");
		if(isSu){
			out.print("alert('修改成功！');");
			out.print("location.href='RoleList';");
		}else{
			out.print("alert('修改失败！');");
			out.print("location.href='toUpdateRole?row_id="+role.getRowid()+"';");
		}
		out.print("</script>");
		//return "redirect:roleList";//跳转到mvc请求地址前面要加redirect:或者forword:
		return null;
	}
	
	//删除系统角色
	@RequestMapping("manage/toDelRole")
	public String toDelRole(String ids)throws Exception{
		System.out.println("ids:"+ids);
		String[] idStr=ids.split(",");
		SysRole sysRole=new SysRole().setIdArray(idStr);
		sysRoleManage.delSysRole(sysRole);
		return "redirect:RoleList";
	}
	
	//跳转添加系统角色界面
	@RequestMapping("manage/toAddRole")
	public String toAddRole(){
		return "manage/addRole";
	}
	
	//ajax判断角色名称是否存在
	@RequestMapping("manage/ajaxCkRole")
	public String ajaxCkRole(@RequestParam("roleName")String roleName,HttpServletResponse resp,Model model) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(roleName!=""){
		boolean isExists=sysRoleManage.ckRoleByRoleName(roleName);
		out.print(isExists);
		}
		out.flush();
		out.close();
		return null;
	}
	
	//ajax判断角色代码是否存在
		@RequestMapping("manage/ajaxCkCode")
		public String ajaxCkCode(@RequestParam("roleCode")String roleCode,HttpServletResponse resp,Model model) throws IOException{
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			if(roleCode!=""){
				boolean isExists=sysRoleManage.ckRoleByRoleCode(roleCode);
				out.print(isExists);
			}
			out.flush();
			out.close();
			return null;
		}
		
		
		//添加系统角色
		@RequestMapping("manage/AddRole")
		public String AddRole(SysRole role,HttpServletResponse resp,HttpSession session) throws Exception{
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			Userbill userbill=(Userbill)session.getAttribute(Tools.CRRUSER);
			role.setLast_upd_by(userbill.getRowid());
			boolean isAdd=sysRoleManage.addSysRole(role);
			out.print("<script>");
			if(isAdd){
				out.print("alert('添加成功！');");
				out.print("location.href='RoleList';");
			}else{
				out.print("alert('添加失败！');");
				out.print("location.href='toAddRole';");
			}
			out.print("</script>");
			return null;
		}
		
		

		//功能配对
		@RequestMapping("manage/userFuncList")
		public String userFuncList(long id,Model model){
			model.addAttribute("id",id);
			//根据传递配对的id查询功能角色表
			List<RoleFunc> roleFunc=roleFuncManage.getAllRoleFunc(new RoleFunc().setRoleid(id).setStatus("1"));
			model.addAttribute("userFuncList",roleFunc);
			//查询系统功能表
			List<SysFunction> funcs=sysFunctionManage.getAllSysFunction(new SysFunction());
			model.addAttribute("funcs",funcs);
			return "manage/roleFuncMapping";
		}


		//修改角色所对应的功能
		@RequestMapping("manage/UpdateRoleFunc")
		public String updateRoleFunc(SysRole role,HttpSession session,HttpServletResponse resp) throws Exception{
			Userbill userbill=(Userbill)session.getAttribute(Tools.CRRUSER);
			role.setLast_upd_by(userbill.getRowid());
			boolean isSu=sysRoleManage.updateSysRoleFunc(role);
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print("<script>");
			if(isSu){
				out.print("alert('执行成功！');");
				out.print("location.href='RoleList';");
			}else{
				out.print("alert('执行失败！');");
				out.print("location.href='toUpdateRole?row_id="+role.getRowid()+"';");
			}
			out.print("</script>");
			//return "redirect:roleList";//跳转到mvc请求地址前面要加redirect:或者forword:
			return null;
		}

}
