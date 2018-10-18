package com.zgc.manage.impl;
import com.zgc.context.PageInter;
import com.zgc.dao.EmployeeDao;
import com.zgc.manage.EmployeeManage;
import com.zgc.model.Employee;
import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class EmployeeManageImpl implements EmployeeManage 
{

	@Autowired
	private EmployeeDao dao;

	@PageInter
	public List<Employee> getAllEmployee(Employee employee)
	{
		return dao.getAllEmployee(employee);
	}

	//根据职工姓名获取id
	public Employee getEmployeeByEmployee(Employee employee)
	{

		return dao.getEmployeeByEmployee(employee);
	}

	public boolean addEmployee(Employee employee)throws Exception 
	{

		return dao.addEmployee(employee)>0;
	}

	public boolean updateEmployee(Employee employee)throws Exception 
	{

		return dao.updateEmployee(employee)>0;
	}

	public boolean delEmployee(Employee employee)throws Exception 
	{

		return dao.delEmployee(employee)>0;
	}

	//判断职工存不存在
	public boolean ckEmpByName(String employeeName) {
		// TODO Auto-generated method stub
		return dao.getEmployeeByEmployee(new Employee().setName(employeeName))!=null;
	}

	//职工存在的情况下判断有没有有用户
	public boolean ckUserByUser(String empName) {
		// TODO Auto-generated method stub
		return dao.getEmployeeByisEmployee(new Employee().setName(empName))!=null;
	}

	//根据登录所得的的id查询职工名字
	public Employee getEmployeeByUserbill(long rowid) {
		// TODO Auto-generated method stub
		return dao.getEmployeeByEmployee(new Employee().setStaffid(rowid));
	}

	//添加销售信息时判断销售人姓名存不存在
	public boolean ckEmployeeByName(Employee employee) {
		// TODO Auto-generated method stub
		return dao.getEmployeeByEmployee(employee)!=null;
	}


}