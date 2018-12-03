package com.bandour.ams.config;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

public class LoginInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        HttpSession session = httpServletRequest.getSession();
        Object user = session.getAttribute("user");
        if (user != null) {
            return true;
        } else {
            String appCode="ams_api";
            String appSecret="YParuwnZmnkSbi8GoQvJ4g";
            String amsUrl="http://ams.bandour.cn/ams";
            String redirectUrl="http://192.168.0.9/index";
            String redirect_url= URLEncoder.encode( redirectUrl,"UTF-8");
            String ssoUrl=amsUrl+"/sso?app_code="+appCode+"&app_secret="+appSecret+"&redirect_uri="+redirect_url;
            httpServletResponse.sendRedirect(ssoUrl);
            return false;
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
