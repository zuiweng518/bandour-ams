package com.bandour.ams.controller;

import com.bandour.ams.entity.Param;
import com.bandour.ams.service.ApiService;
import com.bandour.ams.entity.Api;
import com.bandour.ams.service.ParamService;
import com.bandour.ams.utils.HttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/api")
public class ApiController {
    @Autowired
    private ApiService apiService;
    @Autowired
    private ParamService param;

    //接口调试页面
    @RequestMapping(path = "/page")
    public ModelAndView main(ModelAndView view) {
        List<Api> list = apiService.findAll();
        view = new ModelAndView("form");
        view.addObject("apiList", list);
        return view;
    }

    //前台进行接口调试时，获取接口查询的结果
    @RequestMapping(path = "/query", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> query(HttpServletRequest request) throws Exception {

        Map<String, String> map = new HashMap<String, String>();
        Enumeration<String> parameterNames=request.getParameterNames();
        while(parameterNames.hasMoreElements()){
            String param=parameterNames.nextElement();
            map.put(param,request.getParameter(param));
        }
        String url = URLDecoder.decode(request.getParameter("url"), "UTF-8");
        String apiId = request.getParameter("api");
        String  apiName= apiService.findById(Integer.parseInt(apiId)).getName();
        map.put("url",url);
        HttpClient http = new HttpClient();
        String json="";
        if(apiName.equals("/rest/token/getToken")){
            json=http.getToken(map);
        }else{
            map.put("api",apiName);
            json= http.getInfo(map);
        }
        map.clear();
        map.put("content", json);
        System.out.println("JSON:"+json);
        return map;
    }

    //根据接口ID获取接口的参数项
    @RequestMapping(value = "/queryOptionById",method = RequestMethod.GET)
    @ResponseBody
    public List<Param> queryOptionById(HttpServletRequest request){
        int id=Integer.parseInt(request.getParameter("id"));
        List<Param> list=param.findById(id);
        return list;
    }
    @RequestMapping(value = "/queryApiByName",method = RequestMethod.GET)
    @ResponseBody
    public List<Api> queryApiByName(HttpServletRequest request){
        String name=request.getParameter("name");
        List<Api> list=apiService.queryApiByName(name);
        return list;
    }


}