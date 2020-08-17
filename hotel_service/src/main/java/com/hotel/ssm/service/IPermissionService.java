package com.hotel.ssm.service;

import com.hotel.ssm.domain.Permission;

import java.util.List;

public interface IPermissionService {
    //查询所有权限
    List<Permission> findAll() throws Exception;

    //添加权限
    void save(Permission permission) throws Exception;

    //权限详情查询
    Permission findById(String id) throws Exception;

    //根据id删除权限
    void deleteById(String id) throws Exception;
}
