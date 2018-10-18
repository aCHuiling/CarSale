package com.zgc.tool;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zgc.dao.BaseDao;
import com.zgc.model.BaseModel;
import com.zgc.model.PageModel;

@Repository
public class BaseDaoTools {
	
	@Autowired
	private BaseDao baseDao;
	@Resource(name="sqlSession")
	private SqlSessionFactory sf;
	//interfDao接口实现类的对象（dao）
	public void pageTools(BaseModel model,Object interfDao,String method){
		PageModel page=model.getPageModel();
		//接口实现类的对象->类->接口（一个xml对应一个接口）
		Class interfCl=interfDao.getClass().getInterfaces()[0];
		//方法配置信息（配置文件->方法集合（包名.类名.方法名））
		BoundSql bSql=sf.getConfiguration().getMappedStatement(interfCl.getName()+"."+method).getBoundSql(model);
		//获取查询语句sql
		String sql=bSql.getSql();
		//获取查询数量（sql语句）
		String countSql="select count(1) from ("+sql+") temp";
		List<ParameterMapping> parms=bSql.getParameterMappings();
		for(int i=0;i<parms.size();i++){
			//获取参数名
			String pro=parms.get(i).getProperty();
			System.out.println("pro:"+pro);
			//将？替换成参数名
			countSql=countSql.replaceFirst("[?]","#{"+pro+"}");
		}
		model.setCountsql(countSql);
		System.out.println("cntSql:"+countSql);
		int cnt=baseDao.getCount(model);
		//总页数
		page.setTotalCount(cnt);
		model.setPageSql("limit "+(page.getCurrPage()-1)*page.getPageSize()+","+page.getPageSize());
		System.out.println("cnt:"+cnt);
		//System.out.println("cntSql:"+countSql);
		//System.out.println("sql:"+sql);
	}
	

}
