package com.vegetarian.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;

@Service
public class FileService {
    @Autowired
    private ServletContext servletContext;

    public void save(MultipartFile file) {
        if(!file.isEmpty()){
            try {
                String rootDir = servletContext.getRealPath("/disk\\resources\\img\\upload\\");
                file.transferTo(new File(rootDir,file.getOriginalFilename()));
            } catch (IOException e) {
                e.getMessage();
            }
        }
    }

}