package com.hx.rm.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hx.rm.entity.Page;
import com.hx.rm.entity.Role;
import com.hx.rm.entity.User;
@Repository
public interface BaseService<E> {
	List<E> list();//查询所有数据
	Page<E> find(int cPage, int pageNum, String condition);//分页查询
	E load(int id);//查询一条数据
	int add(E entity, int[] ids);//添加
	int delete(int id);//删除
	int update(E entity);//修改
	
}
