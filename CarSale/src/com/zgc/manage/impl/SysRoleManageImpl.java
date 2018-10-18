package com.zgc.manage.impl;
import com.zgc.context.PageInter;
import com.zgc.dao.RoleFuncDao;
import com.zgc.dao.SysFunctionDao;
import com.zgc.dao.SysRoleDao;
import com.zgc.manage.SysRoleManage;
import com.zgc.model.RoleFunc;
import com.zgc.model.SysFunction;
import com.zgc.model.SysRole;
import java.util.*;
import java.lang.Exception;

import org.springframework.beans.factory.annotation.Autowired;

public class SysRoleManageImpl implements SysRoleManage 
{

	@Autowired
	private SysRoleDao dao;
	@Autowired
	private RoleFuncDao roleFuncDao;
	@Autowired
	private SysFunctionDao sysFunctionDao;

	//查询所有系统角色
	@PageInter//分页
	public List<SysRole> getAllSysRole(SysRole sysRole)
	{
		sysRole.setStatus("1");
		return dao.getAllSysRole(sysRole);
	}

	public SysRole getSysRoleBySysRole(SysRole sysRole)
	{

		return dao.getSysRoleBySysRole(sysRole);
	}

	//添加系统角色
	public boolean addSysRole(SysRole sysRole)throws Exception 
	{

		boolean isSu=true;
		SysRole sysRoleModel=dao.getSysRoleBySysRole(sysRole.setCreatedby(sysRole.getLast_upd_by()).setCreatedtime(new Date()));
		if(sysRoleModel!=null){
			isSu=dao.updateSysRole(sysRole.setStatus("1").setCreatedby(sysRole.getLast_upd_by()).setCreatedtime(new Date()).setRowid(sysRoleModel.getRowid()))>0;
		}else{
			isSu=dao.addSysRole(sysRole.setStatus("1").setCreatedby(sysRole.getLast_upd_by()).setCreatedtime(new Date()))>0;
		}
		return isSu;
	}

	//修改系统角色对应系统功能
	public boolean updateSysRoleFunc(SysRole sysRole)throws Exception 
	{

		List<SysFunction> funcList=sysFunctionDao.getAllSysFunction(new SysFunction());
		//boolean isSu=dao.updateSysRole(sysRole)>0;
		boolean isSu=true;
		//if(isSu){
		roleFuncDao.delRoleFunc(new RoleFunc().setRoleid(sysRole.getRowid()));//把对应功能角色删了
		if(sysRole.getFunction_ids()!=null)
			for(int i=0;i<sysRole.getFunction_ids().length;i++){
				int funId=sysRole.getFunction_ids()[i];
				//根据选中的功能id获取相应的父级id
				SysFunction funcModel=sysFunctionDao.getSysFunctionBySysFuncId(new SysFunction().setRowid(funId));
				for(SysFunction f:funcList){
					//如果获得的父级id与集合中的功能id相等，就添加或修改父级功能
					if(funcModel.getParentid()==f.getRowid()){
						int funid=(int) f.getRowid();
						RoleFunc roleFuncModel=roleFuncDao.getRoleFuncByRoleFunc(new RoleFunc().setRoleid(sysRole.getRowid()).setFuncid(funid));
						if(roleFuncModel!=null){
							isSu=roleFuncDao.updateRoleFunc(roleFuncModel.setStatus("1").setCreatedby(sysRole.getLast_upd_by()).setCreatedtime(new Date()))>0;
						}else{
							isSu=roleFuncDao.addRoleFunc(new RoleFunc().setCreatedby(sysRole.getLast_upd_by()).setRoleid(sysRole.getRowid()).setFuncid(funid).setCreatedtime(new Date()).setStatus("1"))>0;
						}
					}
				}
				//添加或修改二级功能
				RoleFunc roleFuncModel=roleFuncDao.getRoleFuncByRoleFunc(new RoleFunc().setRoleid(sysRole.getRowid()).setFuncid(funId));
				if(roleFuncModel!=null){
					isSu=roleFuncDao.updateRoleFunc(roleFuncModel.setStatus("1").setCreatedby(sysRole.getLast_upd_by()).setCreatedtime(new Date()))>0;
				}else{
					isSu=roleFuncDao.addRoleFunc(new RoleFunc().setCreatedby(sysRole.getLast_upd_by()).setRoleid(sysRole.getRowid()).setFuncid(funId).setCreatedtime(new Date()).setStatus("1"))>0;
				}
			}
		//}
		return isSu;
	}

	public boolean delSysRole(SysRole sysRole)throws Exception 
	{

		return dao.delSysRole(sysRole)>0;
	}
	//查询所有系统角色
	public List<SysRole> getAllSysRoleMenu(SysRole sysRole) {
		// TODO Auto-generated method stub
		sysRole.setStatus("1");
		return dao.getAllSysRole(sysRole);
	}

	//根据角色名称判断系统角色是否存在
	public boolean ckRoleByRoleName(String roleName) {
		// TODO Auto-generated method stub
		return dao.getSysRoleBySysRole(new SysRole().setRolename(roleName).setStatus("1")) != null;
	}
	//根据角色代码判断系统角色是否存在
	public boolean ckRoleByRoleCode(String roleCode) {
		// TODO Auto-generated method stub
		return dao.getSysRoleBySysRole(new SysRole().setRolecode(roleCode).setStatus("1")) != null;
	}

	//修改系统角色
	public boolean updateSysRole(SysRole sysRole) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateSysRole(sysRole)>0;
	}


}