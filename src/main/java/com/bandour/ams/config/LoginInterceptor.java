package com.bandour.ams.config;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.net.URLEncoder;

public class LoginInterceptor implements HandlerInterceptor{
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        HttpSession session = httpServletRequest.getSession();
        Object user=session.getAttribute("user");
        if(user!=null){
            return true;
        }
        else{
            String app_code="demo";
            String app_secret="0RD9eFA6XsLnPpqhrToFmd";
            String amsUrl="http://ams.bandour.com:888/ams/sso?";
            String redirect_url= URLEncoder.encode( "http://192.168.1.3:8080/index","UTF-8");
            String ssoUrl=amsUrl+"app_code="+app_code+"&app_secret="+app_secret+"&redirect_uri="+redirect_url;
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
