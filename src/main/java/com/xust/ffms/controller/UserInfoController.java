package com.xust.ffms.controller;


import com.xust.ffms.configs.Md5UtilSimple;
import com.xust.ffms.dao.UserInfoMapper;
import com.xust.ffms.entity.Privilege;
import com.xust.ffms.entity.Role;
import com.xust.ffms.entity.RoleVo;
import com.xust.ffms.entity.UserInfo;
import com.xust.ffms.service.PrivilegeService;
import com.xust.ffms.service.UserInfoService;
import com.xust.ffms.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserInfoController {

    @Resource
    private UserInfoService userInfoService;
    @Resource
    private PrivilegeService privilegeService;
    @Autowired
    UserInfoMapper userInfoMapper;

    @RequestMapping(value = {"/", "login.html"})
    public String toLogin(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        System.out.println(session.getAttribute(Config.CURRENT_USERNAME));
        if (session.getAttribute(Config.CURRENT_USERNAME) == null) {
            return "/login";
        } else {
            try {
                response.sendRedirect("/pages/index");
            } catch (IOException e) {
                e.printStackTrace();
                return "/login";
            }
            return null;
        }

    }

    @RequestMapping(value = "register.html")
    public String toRegister(HttpServletRequest request, HttpServletResponse response) {
        return "register";
    }

    //    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    @RequestMapping(value = "/login.do")
    @ResponseBody
    public Result getUserInfo(UserInfo userInfo, HttpServletRequest request, HttpServletResponse response) {
        boolean userIsExisted = userInfoService.userIsExisted(userInfo);
        System.out.println(userIsExisted + " - " + request.getHeader("token"));
        UserInfo user = getUserInfo(userInfo);
        if ("client".equals(request.getHeader("token")) || !userIsExisted) {
            //The user does not exist!
            return ResultUtil.unSuccess("The user does not exist!");
        }
        if (userIsExisted && !user.getPassword().equals(Md5UtilSimple.md5(userInfo.getPassword()))) {
            return ResultUtil.unSuccess("The username or password is incorrect!");
        } else {
            //Storing user information into session
            userInfo = setSessionUserInfo(user, request.getSession());
            //Storing current user information in a cookie
            setCookieUser(request, response);
            return ResultUtil.success("Login Successful", userInfo);
        }
    }

    @RequestMapping(value = "/register.do")
    @ResponseBody
    public Result register(UserInfo userInfo, HttpServletRequest request, HttpServletResponse response) {
        System.out.println(userInfo);

        boolean userIsExisted = userInfoService.userIsExisted(userInfo);
        if (userIsExisted) {
            return ResultUtil.unSuccess("The user already exists!");
        }
        try {
            userInfo.setPassword(Md5UtilSimple.md5(userInfo.getPassword()));
            int num = userInfoService.add(userInfo);
            if (num > 0) {
                return ResultUtil.success();
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/users/getUsersByWhere/{pageNo}/{pageSize}")
    public @ResponseBody
    Result getUsersByWhere(UserInfo userInfo, @PathVariable int pageNo, @PathVariable int pageSize, HttpSession session) {
        /*if (StringUtils.isEmpty(userInfo.getHouseid())) {
            if (Config.getSessionUser(session)!=null){
                userInfo.setHouseid(Config.getSessionUser(session).getHouseid());
            }
        }*/
        Utils.log(userInfo.toString());
        PageModel model = new PageModel<>(pageNo, userInfo);
        model.setPageSize(pageSize);
        return userInfoService.getUsersByWhere(model);
    }

    @RequestMapping("/user/add")
    public @ResponseBody
    Result addUser(UserInfo userInfo,HttpSession session) {
        boolean userIsExisted = userInfoService.userIsExisted(userInfo);
        if (userIsExisted) {
            return ResultUtil.unSuccess("The user already exists!");
        }
        if (Config.getSessionUser(session)!=null){
            userInfo.setHouseid(Config.getSessionUser(session).getHouseid());
        }
        System.out.println(userInfo);
        try {
            userInfo.setPassword(Md5UtilSimple.md5(userInfo.getPassword()));
            int num = userInfoService.add(userInfo);
            if (num > 0) {
                return ResultUtil.success();
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }


    @RequestMapping("/user/update")
    public @ResponseBody
    Result updateUser(UserInfo userInfo,HttpSession session) {
        try {
            UserInfo currentUser = Config.getSessionUser(session);
            if (currentUser.getRoleid() == 2){
                userInfo.setRoleid(null);
            }
            int num = userInfoService.update(userInfo);
            if (num > 0) {
                return ResultUtil.success();
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/user/password/change")
    public @ResponseBody
    Result updateUserPassword(UserInfo userInfo, @RequestParam(name = "newPassword") String newPassword, @RequestParam(name = "reNewPassword") String reNewPassword, HttpServletRequest request, HttpServletResponse response) {
        if (!reNewPassword.equals(newPassword)) {
            return ResultUtil.unSuccess("The two new passwords are inconsistent!");
        }
        UserInfo user = getUserInfo(userInfo);
        if (user == null) {
            return ResultUtil.unSuccess("The user does not exist!");
        }
        if (!Md5UtilSimple.md5(userInfo.getPassword()).equals(user.getPassword())) {
            return ResultUtil.unSuccess("The original password is wrong!");
        }
        try {
            user.setPassword(Md5UtilSimple.md5(newPassword));
            int num = userInfoService.changePassword(userInfo, user.getPassword());
            if (num > 0) {
                delCookieUser(request, response);
                request.getSession().removeAttribute(Config.CURRENT_USERNAME);
                System.out.println(request.getSession().getAttribute(Config.CURRENT_USERNAME));

                return ResultUtil.success();
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/user/del/{id}")
    public @ResponseBody
    Result deleteUser(@PathVariable String id) {
        try {
            int num = userInfoService.delete(id);
            if (num > 0) {
                return ResultUtil.success();
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/getSessionUser")
    @ResponseBody
    public UserInfo getSessionUser(HttpSession session) {
        UserInfo sessionUser = (UserInfo) session.getAttribute(Config.CURRENT_USERNAME);
        sessionUser.setPassword(null);
        return sessionUser;
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        delCookieUser(request, response);
        request.getSession().removeAttribute(Config.CURRENT_USERNAME);
        System.out.println(request.getSession().getAttribute(Config.CURRENT_USERNAME));
        return "login";
    }

    @RequestMapping("/getAllRoles")
    public @ResponseBody
    Result<Role> getAllRoles() {
        try {
            List<Role> roles = userInfoService.getAllRoles();
            if (roles.size() > 0) {
                return ResultUtil.success(roles);
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    @RequestMapping("/getAllPrivilege")
    public @ResponseBody
    String getAllPrivilege(String roleId) {
        List<String> ids = userInfoService.getAllPrivilege(roleId);
        if (!CollectionUtils.isEmpty(ids)) {
            String join = String.join(",", ids);
            if (join.indexOf("65") > 0 || join.indexOf("63") >0){
                join += ",62";
            }
            if (join.indexOf("75") > 0 || join.indexOf("76") >0 || join.indexOf("77") >0 || join.indexOf("78") >0){
                join += ",64";
            }
            if (join.indexOf("67") > 0){
                join += ",66";
            }
            if (join.indexOf("74") > 0 ){
                join += ",68";
            }if (join.indexOf("70") > 0 || join.indexOf("71") >0 ){
                join += ",69";
            }
            return join;
        }
        return "";
    }

    @RequestMapping("/role/add")
    public @ResponseBody
    Result addRole(RoleVo role) {
        Role role1 = new Role();
        role1.setRolename(role.getName());
        Role role2 = userInfoMapper.selectRoleByName1(role.getName());
        if (role2 != null) {
            return ResultUtil.unSuccess("This character already exists");
        }
        userInfoService.addRole(role1);
        String[] id = role.getId();
        if (id != null){
            id = deleteArrayNull(id);
        }
        if (id != null && id.length > 0) {
            String join = String.join(",", id);
            if (join.indexOf("65") > 0 || join.indexOf("63") >0){
                join += ",62";
            }
            if (join.indexOf("75") > 0 || join.indexOf("76") >0 || join.indexOf("77") >0 || join.indexOf("78") >0){
                join += ",64";
            }
            if (join.indexOf("67") > 0){
                join += ",66";
            }
            if (join.indexOf("74") > 0 ){
                join += ",68";
            }if (join.indexOf("70") > 0 || join.indexOf("71") >0 ){
                join += ",69";
            }
            String[] split = join.split(",");
            for (int i1 = 0; i1 < split.length; i1++) {
                userInfoMapper.insertPrivileges(role1.getRoleid(), split[i1]);
            }
        }
        return ResultUtil.success();
    }

    @RequestMapping("/role/update")
    public @ResponseBody
    Result updateRole(RoleVo role) {
        userInfoMapper.deletePrivilege(role.getRoleid());
        //userInfoMapper.deleteRole(role.getRoleid());
        Role role2 = userInfoMapper.selectRoleByName(role.getName(),role.getRoleid());
        if (role2 != null) {
            return ResultUtil.unSuccess("This character already exists");
        }
        Role role1 = new Role();
        role1.setRoleid(Integer.valueOf(role.getRoleid()));
        role1.setRolename(role.getName());
        userInfoMapper.updateRole(role1);
        String[] id = role.getId();
        if (id != null){
            id = deleteArrayNull(id);
        }
        if (id != null && id.length > 0) {
            String join = String.join(",", id);
            if (join.indexOf("65") > 0 || join.indexOf("63") >0){
                join += ",62";
            }
            if (join.indexOf("75") > 0 || join.indexOf("76") >0 || join.indexOf("77") >0 || join.indexOf("78") >0){
                join += ",64";
            }
            if (join.indexOf("67") > 0){
                join += ",66";
            }
            if (join.indexOf("74") > 0 ){
                join += ",68";
            }if (join.indexOf("70") > 0 || join.indexOf("71") >0 ){
                join += ",69";
            }
            String[] split = join.split(",");
            for (int i1 = 0; i1 < split.length; i1++) {
                userInfoMapper.insertPrivileges(role1.getRoleid(), split[i1]);
            }
        }
        return ResultUtil.success();
    }

    @RequestMapping("/role/del/{roleid}")
    public @ResponseBody
    Result deleteRole(@PathVariable String roleid) {
        userInfoMapper.deletePrivilege(roleid);
        userInfoMapper.deleteRole(roleid);
        return ResultUtil.success();
    }

    private String[] deleteArrayNull(String string[]) {
        String strArr[] = string;

        // step1: Define a list of lists and assign values cyclically
        ArrayList<String> strList = new ArrayList<String>();
        for (int i = 0; i < strArr.length; i++) {
            strList.add(strArr[i]);
        }

        // step2: Remove all null values from the list
        while (strList.remove(null));
        while (strList.remove(""));

        // step3: Converts the list list to a newly defined intermediate array and assigns it values
        String strArrLast[] = strList.toArray(new String[strList.size()]);

        return strArrLast;
    }
    @RequestMapping("/getRole/{id}")
    public @ResponseBody
    Result getRoleById(@PathVariable String id) {
        try {
            Role role = userInfoService.getRoleById(id);
            if (role != null) {
                return ResultUtil.success(role);
            } else {
                return ResultUtil.unSuccess();
            }
        } catch (Exception e) {
            return ResultUtil.error(e);
        }
    }

    /**
     * Add user information to cookie when logging in
     *
     * @param response
     */
    private void setCookieUser(HttpServletRequest request, HttpServletResponse response) {
        UserInfo user = getSessionUser(request.getSession());
        Cookie cookie = new Cookie(Config.CURRENT_USERNAME, user.getUsername() + "_" + user.getId());
        
        cookie.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(cookie);
    }

    /**
     * Delete cookie information when logging out
     *
     * @param request
     * @param response
     */
    private void delCookieUser(HttpServletRequest request, HttpServletResponse response) {
        UserInfo user = getSessionUser(request.getSession());
        Cookie cookie = new Cookie(Config.CURRENT_USERNAME, user.getUsername() + "_" + user.getId());
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }

    /**
     * Get user permission information by user information and store it in session
     *
     * @param userInfo
     * @param session
     * @return
     */
    public UserInfo setSessionUserInfo(UserInfo userInfo, HttpSession session) {
        List<Privilege> privileges = privilegeService.getPrivilegeByRoleid(userInfo.getRoleid());
        userInfo.setPrivileges(privileges);
        session.setAttribute(Config.CURRENT_USERNAME, userInfo);
        return userInfo;

    }

    public UserInfo getUserInfo(UserInfo userInfo) {
        return userInfoService.getUserInfo(userInfo);
    }

//    public static void main(String[] args) {
//        int i = "3,4".indexOf("5");
//        System.out.println(i);
//    }

}
