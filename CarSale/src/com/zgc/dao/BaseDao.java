package com.zgc.dao;

import org.springframework.stereotype.Repository;

import com.zgc.model.BaseModel;

@Repository
public interface BaseDao {

	//所有实体类继承BaseModel，可以获取所有实体类
	public int getCount(BaseModel model);
}
