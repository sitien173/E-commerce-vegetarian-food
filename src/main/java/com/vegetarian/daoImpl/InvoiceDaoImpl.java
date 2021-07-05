package com.vegetarian.daoImpl;

import com.vegetarian.dao.InvoiceDao;
import com.vegetarian.entity.Invoice;
import com.vegetarian.mapper.InvoiceMapper;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class InvoiceDaoImpl implements InvoiceDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private InvoiceMapper invoiceMapper;
    @Override
    public int insertInvoice(Invoice invoice) {
        String SQL = "INSERT INTO [invoice](username,created_at,description, status, pay_method, sub_total, total) " +
                "values(?,?,?,?,?,?,?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(new PreparedStatementCreator() {
            @NotNull
            @Override
            public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                PreparedStatement ps = con.prepareStatement(
                        SQL, new String[]{"id"});
                ps.setString(1, invoice.getUser().getUsername());
                ps.setString(2, LocalDateTime.now().toString());
                ps.setString(3, invoice.getDescription());
                ps.setInt(4,invoice.getStatus());
                ps.setString(5, invoice.getPayMethod());
                ps.setDouble(6, invoice.getSubTotal());
                ps.setDouble(7, invoice.getTotal());
                return ps;
            }
        },keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    public boolean update(Invoice invoice) {
        String SQL = "update [invoice] set created_at=?,description=?,status=? where id=?";
        Object[] inputs = new Object[]{
                invoice.getCreatedAt(),
                invoice.getDescription(),
                invoice.getStatus(),
                invoice.getId(),
        };
        return jdbcTemplate.update(SQL,inputs) > 0;
    }

    @Override
    public boolean delete(int id) {
        String SQL = "delete from [invoice] where id=?";
        return jdbcTemplate.update(SQL,id) > 0;
    }

    @Override
    public boolean updateStatus(int status, int invoiceId) {
        String SQL = "update [invoice] set status = ? where id = ?";
        Object[] inputs = new Object[]{
                status,
                invoiceId
        };
        return jdbcTemplate.update(SQL,inputs) > 0;
    }

    @Override
    public List<Invoice> getAllInvoiceByStatus(int status) {
        String SQL = "select * from [invoice] where status = "+status+"";
        return jdbcTemplate.query(SQL,invoiceMapper);
    }

    @Override
    public Invoice getInvoice(int invoiceId) throws EmptyResultDataAccessException {
        String SQL = "select * from [invoice] where id=?";
        return jdbcTemplate.queryForObject(SQL,new Object[]{invoiceId},invoiceMapper);
    }

    @Override
    public List<Invoice> getAllInvoice() throws EmptyResultDataAccessException {
        String SQL = "select * from [invoice]";
        return jdbcTemplate.query(SQL,invoiceMapper);
    }

    @Override
    public List<Invoice> getAllInvoiceByStatus(int status,String username) throws EmptyResultDataAccessException{
        String SQL = "select * from [invoice] where username = ? and status = ?";
        Object[] inputs = new Object[]{
                username,
                status,
        };
        return jdbcTemplate.query(SQL,inputs,invoiceMapper);
    }

    @Override
    public List<Invoice> getAllInvoiceByUsername(String username) {
        String SQL = "select * from [invoice] where username = ?";
        return jdbcTemplate.query(SQL,new Object[]{username},invoiceMapper);
    }
}
