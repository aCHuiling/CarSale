package com.zgc.control;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zgc.manage.EmployeeManage;
import com.zgc.model.Employee;

@Controller
public class EmployeeControl extends BaseControl{
	@Autowired
	private EmployeeManage empManage;

	@RequestMapping("employee/toAddEmployee")
	public String toAddEmployee(){
		return "employee/addEmployee";
	}
	
	@RequestMapping("employee/AddEmployee")
	public String AddEmployee(Employee emp,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isAdd=empManage.addEmployee(emp);
		out.print("<script>");
		if(isAdd){
			out.print("alert('添加成功！');");
			out.print("location.href='toAddEmployee';");
		}else{
			out.print("alert('添加失败！');");
			out.print("location.href='toAddEmployee';");
		}
		out.print("</script>");
		return null;
	}
	
	@RequestMapping("employee/toLookEmployee")
	public String toLookEmployee(Employee emp,Model model){
		List<Employee> empList=empManage.getAllEmployee(emp);
		model.addAttribute("empList",empList);
		return "employee/lookEmployee";
	}
	
	@RequestMapping("employee/toDelEmployee")
	public String toDelEmployee(Employee emp,Model model){
		List<Employee> empList=empManage.getAllEmployee(emp);
		model.addAttribute("empList",empList);
		return "employee/todelEmployee";
	}
	@RequestMapping("employee/DelEmployee")
	public String DelEmployee(long staffid,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isDel=empManage.delEmployee(new Employee().setStaffid(staffid));
		out.print("<script>");
		if(isDel){
			out.print("alert('删除成功！');");
			out.print("location.href='toDelEmployee';");
		}else{
			out.print("alert('删除失败！');");
			out.print("location.href='toDelEmployee';");
		}
		out.print("</script>");
		return null;
	}
	
	
	@RequestMapping("employee/toUpdateEmployee")
	public String toUpdateEmployee(Employee emp,Model model){
		List<Employee> empList=empManage.getAllEmployee(emp);
		model.addAttribute("empList",empList);
		return "employee/toupdateEmployee";
	}
	@RequestMapping("employee/UpdateEmployee")
	public String UpdateEmployee(long staffid,Model model){
		Employee empModel=empManage.getEmployeeByEmployee(new Employee().setStaffid(staffid));
		model.addAttribute("empModel",empModel);
		return "employee/updateEmployee";
	}
	@RequestMapping("employee/UpdateEmployeeT")
	public String UpdateEmployeeT(Employee emp,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		boolean isSu=empManage.updateEmployee(emp);
		out.print("<script>");
		if(isSu){
			out.print("alert('修改成功！');");
			out.print("location.href='toUpdateEmployee';");
		}else{
			out.print("alert('修改失败！');");
			out.print("location.href='UpdateEmployee';");
		}
		out.print("</script>");
		return null;
	}
}
