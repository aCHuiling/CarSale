package com.zgc.manage;
import com.zgc.model.Employee;
import java.util.*;
import java.lang.Exception;

public interface EmployeeManage 
{


public List<Employee> getAllEmployee(Employee employee);

public Employee getEmployeeByEmployee(Employee employee);

public boolean addEmployee(Employee employee)throws Exception ;

public boolean updateEmployee(Employee employee)throws Exception ;

public boolean delEmployee(Employee employee)throws Exception ;

public boolean ckEmpByName(String employeeName);

public boolean ckUserByUser(String empName);

public Employee getEmployeeByUserbill(long rowid);

public boolean ckEmployeeByName(Employee employee);


}