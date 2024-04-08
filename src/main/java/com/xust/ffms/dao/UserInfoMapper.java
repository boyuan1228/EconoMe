package com.xust.ffms.dao;


import com.xust.ffms.entity.House;
import com.xust.ffms.entity.Role;
import com.xust.ffms.entity.UserInfo;
import com.xust.ffms.utils.PageModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserInfoMapper {

    /**
     * Get individual user information that can be used:
     * 1. Logging in
     * 2. Obtaining complete information about a user from a part of the user's information
     * @param userInfo
     * @return
     */
    UserInfo getUserInfo(UserInfo userInfo);

    /**
     * Login
     * @param userInfo
     * @return
     */
    int addUser(UserInfo userInfo);

    /**
     * Determine if the user exists by username
     * @param userInfo
     * @return
     */
    int userIsExisted(UserInfo userInfo);

    /**
     * Obtaining eligible optimization information through conditions -- Paging
     * @param model
     * @return
     */
    List<UserInfo> getUsersByWhere(PageModel<UserInfo> model);

    int getToatlByWhere(PageModel<UserInfo> model);

    int add(UserInfo userInfo);

    int update(UserInfo userInfo);

    int changePassword(Integer id,String newPassword);

    int delete(String id);

    List<Role> getAllRoles();

    int addRole(Role role);

    int updateRole(Role role);

    int deleteRole(String id);

    Role getRoleById(String id);

    int addHouseId(House house);

    List<String> getAllPrivilege(@Param("id") String roleId);

    void deletePrivilege(@Param("id") String roleid);

    Role selectRoleByName(@Param("name") String name,@Param("id") String roleid);

    Role selectRoleByName1(@Param("name") String name);

    void insertPrivileges(@Param("roleid") int i, @Param("id") String s);

    void addRole1(Role role1);
}
