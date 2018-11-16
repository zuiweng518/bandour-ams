package com.bandour.ams.service;

import com.bandour.ams.entity.Api;

import java.util.List;

public interface ApiService {
    List<Api> findAll();
    Api findById(int id);
    List<Api> queryApiByName(String name);

}
