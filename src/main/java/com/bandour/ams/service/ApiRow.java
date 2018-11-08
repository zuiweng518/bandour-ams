package com.bandour.ams.service;

import com.bandour.ams.entity.Api;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ApiRow implements RowMapper<Api> {
    @Override
    public Api mapRow(ResultSet resultSet, int i) throws SQLException {
        int id=resultSet.getInt("id");
        String name=resultSet.getString("name");
        String annotation=resultSet.getString("annotation");
        Api api=new Api();
        api.setId(id);
        api.setName(name);
        api.setAnnotation(annotation);
        return api;
    }
}
