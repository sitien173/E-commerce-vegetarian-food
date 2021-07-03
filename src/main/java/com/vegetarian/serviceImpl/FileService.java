package com.vegetarian.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;

@Service
public class FileService {

    @Autowired
    private ServletContext servletContext;
    private static String rootDir;

    @PostConstruct
    public void init(){
        rootDir = servletContext.getRealPath("/disk\\resources\\img\\upload\\");
    }
    public static void save(MultipartFile file) {
        try {
            if(!file.isEmpty()){
                file.transferTo(new File(rootDir, file.getOriginalFilename()));
            }
        } catch (IOException e) {
            throw new RuntimeException("Could not store the file. Error: " + e.getMessage());
        }
    }

}