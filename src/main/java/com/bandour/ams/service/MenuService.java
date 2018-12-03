package com.bandour.ams.service;

import com.bandour.ams.entity.Menu;

import java.util.List;

public interface MenuService  {
    public List<Menu> findMenusByMenuCode(List<String> menuCode);

}
