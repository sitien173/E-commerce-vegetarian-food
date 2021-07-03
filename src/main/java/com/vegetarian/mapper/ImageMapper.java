package com.vegetarian.mapper;

import com.vegetarian.entity.Image;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class ImageMapper implements RowMapper<Image> {

    @Override
    public Image mapRow(ResultSet rs, int rowNum) throws SQLException {
        Image image = new Image();
        image.setId(rs.getInt("id"));
        image.setLocation(rs.getString("location"));
        return image;
    }
}
