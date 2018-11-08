package com.bandour.ams.service;

import com.bandour.ams.entity.Param;

import java.util.List;

public interface ParamService {
    List<Param> findById(int id);
}
