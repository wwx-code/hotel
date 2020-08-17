package com.hotel.ssm.dao;

import com.hotel.ssm.domain.Permission;
import com.hotel.ssm.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {

    //根据用户id查询出所有对应的角色
    @Select("select * from role where id in (select roleId from users_role where userId = #{userId})")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",
                    column = "id",
                    javaType = java.util.List.class,
                    many = @Many(select = "com.hotel.ssm.dao.IPermissionDao.findPermissionByRoleId"))
    })
    public List<Role> findRoleByUserId(String userId) throws Exception;

    //查询所有角色
    @Select("select * from role")
    List<Role> findAll() throws Exception;

    //添加角色
    @Insert("insert into role(roleName,roleDesc) values(#{roleName},#{roleDesc}) ")
    void save(Role role) throws Exception;

    //根据id查询角色
    @Select("select * from role where id = #{roleId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",
                    column = "id",
                    javaType = java.util.List.class,
                    many = @Many(select = "com.hotel.ssm.dao.IPermissionDao.findPermissionByRoleId"))
    })
    Role findById(String roleId) throws Exception;

    @Delete("delete from users_role where roleId = #{roleId}")
    void deleteFromUser_RoleByRoleId(String roleId) throws Exception;

    @Delete("delete from role_permission where roleId = #{roleId}")
    void deleteFromRole_PermissionByRoleId(String roleId) throws Exception;

    @Delete("delete from role where id = #{roleId}")
    void deleteRoleByRoleId(String roleId) throws Exception;

    @Select("select * from permission where id not in (select permissionId from role_permission where roleId = #{roleid})")
    List<Permission> findOtherPermissions(String roleId) throws Exception;

    @Insert("insert into role_permission(roleId,permissionId) values(#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId") String roleId,@Param("permissionId") String permissionId) throws Exception;
}
