package com.bandour.ams.service;

import com.bandour.ams.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private JdbcTemplate jdbc;

    @Override
    public List<Menu> findMenusByMenuCode(List<String> menuCode) {
        String sql="select id,code,name,url from menu where code='"+menuCode.get(0)+"'";
        for(int i=1;i<menuCode.size();i++){
            sql+=" union all";
            sql+=" select id,code,name,url from menu where code='"+menuCode.get(i)+"'";
        }
        List<Menu> list=jdbc.query(sql,new MenuRow());
        return list;
    }
    public static void main(String[]args){
        String demo="\"a\",\"b\",\"c\"";
        demo=demo.replace("\"","");
        String[] a=demo.split(",");
        List<String> s= Arrays.asList(a);
        for(String str:s){
            System.out.println(str);
        }
    }
}
