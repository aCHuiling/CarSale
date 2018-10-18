package com.zgc.dao;
import com.zgc.model.Employee;
import java.util.*;
import java.lang.Exception;

public interface EmployeeDao 
{


public List<Employee> getAllEmployee(Employee employee);

public Employee getEmployeeByEmployee(Employee employee);

public int addEmployee(Employee employee)throws Exception ;

public int updateEmployee(Employee employee)throws Exception ;

public int delEmployee(Employee employee)throws Exception ;

public Employee getEmployeeByisEmployee(Employee setName);


}