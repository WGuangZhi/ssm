package com.hx.rm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hx.rm.entity.Page;
import com.hx.rm.entity.Permission;
@Repository
public interface BaseDao<E> {
	//这里的方法名必须和就具体的映射文件的sql   ID 保持对应
	E load(@Param("id")int id);//根据ID查询一条数据
	List<E> list();//查询多条数据
	List<E> find(Map map);//分页查询数据
	int count(Map map);
	int add(E entity);//添加数据
	int delete(@Param("id") int id);//删除
	int update(E entity);//修改
}
