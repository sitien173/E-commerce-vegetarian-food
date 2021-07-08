package com.vegetarian.serviceImpl;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.Part;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.Objects;

@Service
public class FileService {
    @Autowired
    private ServletContext servletContext;
    private static String rootDir;
    @PostConstruct
    public void init(){
        rootDir = servletContext.getRealPath("/disk\\resources\\img\\upload\\");
    }
    public void save(MultipartFile file) {
        if(!file.isEmpty()){
            try {
                file.transferTo(new File(rootDir,file.getOriginalFilename()));
            } catch (IOException e) {
                e.getMessage();
            }
        }
    }

}