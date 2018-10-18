package com.zgc.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.zgc.manage.EmployeeManage;
import com.zgc.manage.SysFunctionManage;
import com.zgc.manage.SysRoleManage;
import com.zgc.manage.UserRoleManage;
import com.zgc.manage.UserbillManage;
import com.zgc.model.Employee;
import com.zgc.model.SysFunction;
import com.zgc.model.SysRole;
import com.zgc.model.UserRole;
import com.zgc.model.Userbill;
import com.zgc.tool.Tools;

@Controller
public class EmpUserControl extends BaseControl{

	@Autowired
	private UserbillManage userbillManage;
	@Autowired
	private SysFunctionManage functionManage;
	@Autowired
	private EmployeeManage empManage;
	@Autowired
	private UserRoleManage userRoleManage;
	@Autowired
	private SysRoleManage sysRoleManage;

	//跳转登录界面
	@RequestMapping({"/","index.html"})
	public String toLogin(){
		return "index";
	}

	//登录
	@RequestMapping("/login")
	public String login(Userbill user,Model model,HttpSession session){
		Userbill userModel=userbillManage.login(user);
		if(userModel==null){
			model.addAttribute("msg","对不起，您的用户名和密码不匹配");
			return "index";
		}
		//当前用户
		session.setAttribute(Tools.CRRUSER, userModel);
		Employee empUser=empManage.getEmployeeByUserbill(userModel.getRowid());
		//当前职工
		session.setAttribute("currEmpModel", empUser);
		List<SysFunction> funcList=functionManage.getAllFuncByUser(userModel);
		session.setAttribute("menuLeft", funcList);
		return "manage/carMain";
	}
	
	
	@RequestMapping("manage/index")
	public String index(){
		return "index";
	}
	@RequestMapping("manage/toExit")
	public String toExit(HttpSession session,HttpServletResponse resp) throws IOException{

		session.removeAttribute(Tools.CRRUSER);
		return "redirect:index";
//		resp.setContentType("text/html;charset=utf-8");
//		PrintWriter out=resp.getWriter();
//		session.invalidate();
//		out.print("<script>");
//		out.print("location.href='index';");
//		out.print("</script>");
//		return null;
	}
	

	//用户列表、用户查询
	@RequestMapping("manage/toUserManage")
	public String userManageMenu(Model model,Userbill user){
		List<Userbill> userList=userbillManage.getAllUserbill(user);
		model.addAttribute("userList",userList);
		return "manage/userManage";
	}


	//跳转添加用户界面
	@RequestMapping("manage/toAddUser")
	public String toAddUser(){
		return "manage/addUser";
	}


	//ajax判断职工存不存在
	@ResponseBody
	@RequestMapping("manage/ajaxCkEmp")
	public Object ajaxEmp(@RequestParam("EmpName")String employeeName,HttpServletResponse resp,Model model) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		if(employeeName!=""){
			//根据职工姓名获取id
			Employee empModel=empManage.getEmployeeByEmployee(new Employee().setName(employeeName));
			model.addAttribute("empModel",empModel);
			Map<String,Object> empmodel=new HashMap<String, Object>();
			if(empModel!=null){
				empmodel.put("empModel", "true");
				empmodel.put("id", empModel.getStaffid());
			}else{
				empmodel.put("empModel", "false");
			}
			return JSONArray.toJSONString(empmodel);
		}
		return null;
	}



	//ajax判断用户存不存在
	@RequestMapping("manage/ajaxCkUser")
	public String ajaxUser(@RequestParam("userName")String userName,HttpServletResponse resp,HttpSession session) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(userName!=""){
		boolean isExists=userbillManage.ckUserByName(userName);
		out.print(isExists);
		}
		out.flush();
		out.close();
		return null;
	}


	//判断职工存在的情况下判断有没有有用户
	@RequestMapping("manage/ajaxCkisUser")
	public String ajaxCkisUser(@RequestParam("empName")String empName,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		if(empName!=""){
		boolean isExists=empManage.ckUserByUser(empName);
		out.print(isExists);
		}
		out.flush();
		out.close();
		return null;
	}

	//添加用户
	@RequestMapping("manage/AddUser")
	public String addUser(Userbill user,HttpServletResponse resp,HttpSession session) throws Exception{
		Userbill userbillModel=(Userbill) session.getAttribute(Tools.CRRUSER);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isAdd=userbillManage.addUserbill(user.setCreatedby(userbillModel.getRowid()));
		out.print("<script>");
		if(isAdd){
			out.print("alert('添加成功！');");
			out.print("location.href='toUserManage';");
		}else{
			out.print("alert('添加失败！');");
			out.print("location.href='toAddUser';");
		}
		out.print("</script>");
		return null;

	}


	//删除用户
	@RequestMapping("manage/delUser")
	public String delUser(String ids) throws Exception{
		System.out.println("ids:"+ids);
		String[] idStr=ids.split(",");
		Userbill userbill=new Userbill().setIdArray(idStr);
		userbillManage.delUserbill(userbill);
		return "redirect:toUserManage";
	}



	//查看个人信息
	@RequestMapping("manage/toLookPerson")
	public String toLookPerson(Userbill user,HttpSession session,Model model){
		user=(Userbill) session.getAttribute("userModel");
		Userbill userbillModel=userbillManage.getAllUserbillByEmp(user);
		model.addAttribute("userbillModel",userbillModel);
		//session.setAttribute("userbillModel", userbillModel);
		return "manage/lookPerson";
	}


	//跳转到修改个人信息界面
	@RequestMapping("manage/toUpdatePerson")
	public String toUpdatePerson(Userbill user,HttpSession session,Model model){
		user=(Userbill) session.getAttribute("userModel");
		Userbill userbillModel=userbillManage.getAllUserbillByEmp(user);
		model.addAttribute("userbillModel",userbillModel);
		return "manage/updatePerson";
	}


	//修改个人信息
	@RequestMapping("manage/UpdatePerson")
	public String updatePerson(Userbill user,HttpServletResponse resp) throws Exception{
		boolean updatePerson=userbillManage.updateUserbill(user);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print("<script>");
		if(updatePerson){
			out.print("alert('修改成功！');");
		}
		out.print("</script>");
		return "manage/carMain";
	}


	//角色配对
	@RequestMapping("manage/userRoleList")
	public String userRoleList(long id,Model model){
		model.addAttribute("id",id);
		//根据传递配对的id查询用户角色表
		List<UserRole> userRoles=userRoleManage.getAllUserRole(new UserRole().setUserid(id).setStatus("1"));
		model.addAttribute("userRoleList",userRoles);
		//查询系统角色表
		List<SysRole> roles=sysRoleManage.getAllSysRoleMenu(new SysRole());
		model.addAttribute("roles",roles);
		return "manage/userRoleMapping";
	}


	//修改用户所对应的角色
	@RequestMapping("manage/updateUserRole")
	public String updateUserRole(Userbill user,HttpSession session,HttpServletResponse resp) throws Exception{
		Userbill userbillModel=(Userbill) session.getAttribute(Tools.CRRUSER);
		boolean isSu=userRoleManage.updateUserRoleByUser(user.setCreatedby(userbillModel.getRowid()));
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print("<script>");
		if(isSu){
			out.print("alert('执行成功！');");
			out.print("location.href='toUserManage';");
		}else{
			out.print("alert('执行失败！');");
			out.print("location.href='userRoleList';");
		}
		out.print("</script>");
		return null;
	}


	//获取用户信息
	@RequestMapping("manage/toUpdateUser")
	public String toUpdateUser(Userbill user,Model model){
		Userbill userbill=userbillManage.getAllUserbillByEmp(user);
		model.addAttribute("userbill",userbill);
		return "manage/updateUser";
	}

	//修改用户信息
	@RequestMapping("manage/UpdateUser")
	public String updateUser(Userbill user,HttpServletResponse resp) throws Exception{
		boolean updateUser=userbillManage.updateUserbill(user);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print("<script>");
		if(updateUser){
			out.print("alert('修改成功！');");
			out.print("location.href='toUserManage';");
		}else{
			out.print("alert('修改失败！');");
			out.print("location.href='toUpdateUser';");
		}
		out.print("</script>");
		return null;
	}
}
