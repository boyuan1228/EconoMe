package com.xust.ffms.configs;


import com.xust.ffms.controller.UserInfoController;
import com.xust.ffms.entity.UserInfo;
import com.xust.ffms.utils.Config;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;

public class SessionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        System.out.println("token: "+request.getHeader("token"));
        System.out.println(request.getRequestURL());
        HttpSession session = request.getSession();


        //If there is no user information in the session but there is user information in the cookie.
        //Then the information in the cookie is used to reinitialize the user's information to achieve the effect of no-login
        if (session.getAttribute(Config.CURRENT_USERNAME) != null && getCookieUser(request) != null) {
//            System.out.println(HandlerMethod.class +"==="+ handler.getClass());
            if (HandlerMethod.class.equals(handler.getClass())) {
                Object controller = ((HandlerMethod) handler).getBean();
                if (controller instanceof UserInfoController) {
                    UserInfoController userInfoController = (UserInfoController) controller;
                    String userinfoStr = getCookieUser(request);
                    UserInfo userInfo = new UserInfo();
                    userInfo.setId(Integer.parseInt(userinfoStr.split("_")[1]));
                    userInfo.setUsername(userinfoStr.split("_")[0]);
                    userInfo = userInfoController.getUserInfo(userInfo);
                    if (userInfo == null) {
                        return false;
                    }
                    userInfoController.setSessionUserInfo(userInfo, session);
                    return true;
                }
            }
        }

        // Skip login verification if it's a mobile login
        if ("client".equals(request.getHeader("token"))) {
            return true;
        }
        String uri = request.getRequestURI();
        String basePath = request.getContextPath();
//        System.out.println("session:"+uri);
        //It's a login page or a static resource that doesn't block
        if ("/".equals(uri) || "/login.html".equals(uri) || "/register.html".equals(uri) || "/login.do".equals(uri) || "/register.do".equals(uri) || uri.contains("/static/")) {
//            System.out.println("---放行---");
        } else {
            //If it is not a login page, then verify if there is a session, if not, then jump to the login page
            if (session.getAttribute(Config.CURRENT_USERNAME) == null) {
                response.sendRedirect("/login.html");
                return false;
            }
        }
        return true;
    }

    //    @Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
////        System.out.println("postHandle");
//    }
    private boolean doLoginInterceptor(String path, String basePath) {
        path = path.substring(basePath.length());
        Set<String> notLoginPaths = new HashSet<>();
        //Setting up paths without login blocking: login registration and authentication code
        notLoginPaths.add("/");
        notLoginPaths.add("/login.html");
        notLoginPaths.add("/register.html");
        notLoginPaths.add("/login.do");
        notLoginPaths.add("/register.do");
        notLoginPaths.add("/static/");
        //notLoginPaths.add("/sys/logout");
        //notLoginPaths.add("/loginTimeout");

        if (notLoginPaths.contains(path)) return true;
        return false;
    }

    /**
     * Getting user information in a cookie
     *
     * @param request
     * @return
     */
    private String getCookieUser(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return null;
        } else {
            for (Cookie cookie : cookies) {
                if (Config.CURRENT_USERNAME.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
            return null;
        }
    }
}
