package com.bandour.ams.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/file")
public class FileController {
    @Value("${upload_dir}")
    private String upload_dir;
    @RequestMapping("/upload")
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile file){
        String status="{\"status\":\"ok\",\"path\":\"d:\"}";
        try {
            byte[] bytes = file.getBytes();
            Path path = Paths.get(upload_dir + file.getOriginalFilename());
            Files.write(path, bytes);

        }catch (IOException e){
            System.out.println(e.getMessage());
        }

        return JSON.toJSONString(status);
    }
    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView view =new ModelAndView("file");
        return view;
    }
}
