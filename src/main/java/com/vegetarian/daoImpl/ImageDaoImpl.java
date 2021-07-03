package com.vegetarian.daoImpl;

import com.vegetarian.dao.ImageDao;
import com.vegetarian.entity.Image;
import com.vegetarian.mapper.ImageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ImageDaoImpl implements ImageDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private ImageMapper imageMapper;

    @Override
    @Transactional(rollbackFor = SQLException.class)
    public void insert(List<Image> list,int productId) {
        String SQL = "insert into[image](product_id,location) values(?,?)";
        jdbcTemplate.batchUpdate(SQL, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setInt(1,productId);
                ps.setString(2,list.get(i).getLocation());
            }
            @Override
            public int getBatchSize() {
                return list.size();
            }
        });
    }

    @Override
    public List<Image> getAllImage(int productId) throws EmptyResultDataAccessException {
        String SQL = "select * from [image] where product_id = ?";
        return jdbcTemplate.query(SQL,new Object[]{productId},imageMapper);
    }

    @Override
    public boolean update(List<Image> list, int productId) {
        String SQL = "update [image] set location=?,product_id=? where id=?";
        return jdbcTemplate.batchUpdate(SQL, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1,list.get(i).getLocation());
                ps.setInt(2,productId);
                ps.setInt(3,list.get(i).getId());
            }

            @Override
            public int getBatchSize() {
                return list.size();
            }
        }).length > 0;
    }
}
