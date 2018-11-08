package com.bandour.ams.service;

import com.bandour.ams.entity.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParamServiceImpl implements ParamService {
    @Autowired
    JdbcTemplate jdbc;
    @Override
    public List<Param> findById(int id) {
        String sql="select name,id from param where id="+id;
        List<Param> list=jdbc.query(sql,new ParamRow());
        return list;
    }
}
