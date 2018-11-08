package com.bandour.ams.controller;


import com.bandour.ams.service.ApiService;
import com.bandour.ams.utils.HttpClient;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(path = {"/"})
@Component
@PropertySource("classpath:application.properties")
public class IndexController {
    @Value("${app_code}")
    private String app_code;
    @Value("${app_secret}")
    private String app_secret;
    @Value("${ams_url}")
    private String ams_url;
    @Value("${redirect_url}")
    private String redirect_url;
    @Autowired
    private ApiService api;


    @RequestMapping(path = "/index", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView index(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        String code = request.getParameter("code");
        ModelAndView view = null;
        String ssoUrl = ams_url + "/sso?app_code=" + app_code + "&app_secret=" + app_secret + "&redirect_uri=" + URLEncoder.encode(redirect_url, "UTF-8");
        if (user == null && code == null) {
            view = new ModelAndView(new RedirectView(ssoUrl));
            return view;
        }

        String api = "/rest/sso/getUser?code=" + code;
        Map<String, String> map = new HashMap<String, String>();
        map.put("app_code", app_code);
        map.put("app_secret", app_secret);
        map.put("api", api);
        map.put("url", ams_url);
        map.put("token", "token");
        HttpClient httpClient = new HttpClient();
        String userInfo = null;
        try {
            //根据code获取用户信息
            userInfo = httpClient.httpclient(map, "GET");
        } catch (Exception e) {
            System.exit(2);
        }

        JSONObject json = new JSONObject(userInfo);
        String error = json.get("error").toString();
        boolean flag = error.equals("null");
        if (!flag) {
            //如果未获取到用户信息，则携带app_code,app_secret,redirect_uri跳转到AMS登陆页面；
            return new ModelAndView(new RedirectView(ssoUrl));
        }
        //获取用户信息后存入session;
        session.setAttribute("user", json.get("content"));
        view = new ModelAndView(new RedirectView("/api/index"));
        return view;

    }


    @RequestMapping(path = "/logout")
    public ModelAndView logout(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        String ssoUrl = ams_url + "/sso?app_code=" + app_code + "&app_secret=" + app_secret + "&redirect_uri=" + URLEncoder.encode(redirect_url, "UTF-8");
        String logout = "http://ams.bandour.com:888/ams/logout";
        ModelAndView view = new ModelAndView(new RedirectView(logout));
        return view;
    }


}
