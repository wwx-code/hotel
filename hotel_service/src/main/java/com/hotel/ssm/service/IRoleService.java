package com.hotel.ssm.service;

import com.hotel.ssm.domain.Permission;
import com.hotel.ssm.domain.Role;

import java.util.List;

public interface IRoleService {
    //查询所有角色
    List<Role> findAll() throws Exception;

    //保存角色
    void save(Role role) throws Exception;

    //角色详情查询
    Role findById(String roleId) throws Exception;

    //删除角色
    void deleteRoleById(String roleId) throws Exception;

    List<Permission> findOtherPermissions(String roleId) throws Exception;

    //添加权限
    void addPermissionToRole(String roleId, String[] permissionIds) throws Exception;
}
