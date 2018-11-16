package com.bandour.ams.service;

import com.bandour.ams.entity.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApiServiceImpl implements ApiService {
    @Autowired
    private JdbcTemplate jdbc;

    @Override
    public List<Api> findAll() {
        String sql = "select * from api";
        List<Api> list = jdbc.query(sql, new ApiRow());

        return list;
    }

    @Override
    public Api findById(int id) {
        String sql = "select id,name,annotation from api where id="+id;
        Api api = jdbc.queryForObject(sql, new ApiRow());
        return api;
    }
    public List<Api> queryApiByName(String name){
        String sql = "select * from api where name like '%"+name+"%'";
        List<Api> list=jdbc.query(sql,new ApiRow());
        return list;
    }
}
