package com.bandour.ams.service;

import com.bandour.ams.entity.Api;
import com.bandour.ams.entity.Param;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ParamRow implements RowMapper<Param> {
    @Override
    public Param mapRow(ResultSet resultSet, int i) throws SQLException {
        int id=resultSet.getInt("id");
        String name=resultSet.getString("name");
        Param param=new Param();
        param.setId(id);
        param.setName(name);
        return param;
    }

}
