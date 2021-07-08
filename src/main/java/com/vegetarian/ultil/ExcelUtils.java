package com.vegetarian.ultil;

import com.vegetarian.entity.Invoice;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
public class ExcelUtils {
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<Invoice> invoiceList;

    public ExcelUtils(List<Invoice> invoices){
        this.invoiceList = invoices;
        workbook = new XSSFWorkbook();
    }

    private void writeHeaderLine() {
        sheet = workbook.createSheet();
        Row row = sheet.createRow(0);
        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(13);
        font.setBold(true);
        style.setFont(font);
        createCell(row, 0, "ID", style);
        createCell(row, 1, "Username", style);
        createCell(row, 2, "Created At", style);
        createCell(row, 3, "Status", style);
        createCell(row, 4, "Pay Method", style);
        createCell(row, 5, "Description", style);
        createCell(row, 6, "Sub Total", style);
        createCell(row, 7, "Total", style);
    }
    private void createCell(Row row, int columnCount, Object value, CellStyle style) {
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        }else {
            cell.setCellValue((String) value);
        }
        cell.setCellStyle(style);
    }
    private void writeDataLines() {
        int rowCount = 1;
        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(13);
        style.setFont(font);
        int columnCount = 0;
        Double total = 0.0;
        if(invoiceList.size() <= 0){
            int pos = 0;
            createCell(sheet.createRow(pos),pos++,"",style);
            createCell(sheet.createRow(pos),pos++,"",style);
            createCell(sheet.createRow(pos),pos++,"",style);
            createCell(sheet.createRow(pos),pos++,"",style);
            createCell(sheet.createRow(pos),pos++,"",style);
            createCell(sheet.createRow(pos),pos++,"",style);
            createCell(sheet.createRow(pos),pos++,"",style);
            createCell(sheet.createRow(pos),pos++,"",style);
            columnCount = pos;
        }
        for (Invoice invoice : invoiceList) {
            Row row = sheet.createRow(rowCount++);
            columnCount = 0;
            createCell(row, columnCount++, invoice.getId(), style);
            createCell(row, columnCount++, invoice.getUser().getUsername(), style);
            createCell(row, columnCount++, invoice.getCreatedAt().toString(), style);
            createCell(row, columnCount++, "Đã Hoàn Thành", style);
            createCell(row, columnCount++, invoice.getPayMethod(), style);
            createCell(row, columnCount++, invoice.getDescription(), style);
            createCell(row, columnCount++, invoice.getSubTotal().toString(), style);
            createCell(row, columnCount++, invoice.getTotal().toString(), style);
            total += invoice.getTotal();
        }
        createCell(sheet.createRow(rowCount),columnCount - 1,"Tổng cộng",style);
        createCell(sheet.createRow(rowCount),columnCount - 1,total.toString(),style);
    }
    public void export(HttpServletResponse response) throws IOException {
        writeHeaderLine();
        writeDataLines();
        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
    }
}
