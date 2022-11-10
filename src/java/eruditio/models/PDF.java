package eruditio.models;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rlmrsgn
 */
public class PDF {

    public ByteArrayOutputStream userRecord(ResultSet rs, String user, String footer, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        //String path = loader.getResource("/Pictures/logo_rectangle_transparent.png").getPath();
        Document record = new Document();
        record.setPageSize(PageSize.LETTER);
        ByteArrayOutputStream pdf = new ByteArrayOutputStream();

        try {

            PdfWriter.getInstance(record, pdf);

            record.open();

            Image headerImg = Image.getInstance(path);
            headerImg.setAlignment(Image.MIDDLE);
            headerImg.scaleToFit(200, 1000);
            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 12);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);

            Paragraph ad = new Paragraph("ACCOUNT DETAILS", f);
            ad.setAlignment(Element.ALIGN_LEFT);

            PdfPTable adTable = new PdfPTable(1);
            adTable.setWidthPercentage(100);
            adTable.setSpacingBefore(10f);
            adTable.setSpacingAfter(5f);

            PdfPCell adCell = new PdfPCell(ad);
            adCell.setBorder(Rectangle.BOTTOM);
            adCell.setBorderWidth(3);
            adCell.setHorizontalAlignment(Element.ALIGN_LEFT);
            adCell.setVerticalAlignment(Element.ALIGN_LEFT);
            adCell.setPaddingLeft(10);
            adCell.setPaddingBottom(10);

            adTable.addCell(adCell);

            Paragraph pd = new Paragraph("PERSONAL DETAILS", f);
            pd.setAlignment(Element.ALIGN_LEFT);

            PdfPTable pdTable = new PdfPTable(1);
            pdTable.setWidthPercentage(100);
            pdTable.setSpacingBefore(10f);
            pdTable.setSpacingAfter(5f);

            PdfPCell pdCell = new PdfPCell(pd);
            pdCell.setBorder(Rectangle.BOTTOM);
            pdCell.setBorderWidth(3);
            pdCell.setHorizontalAlignment(Element.ALIGN_LEFT);
            pdCell.setVerticalAlignment(Element.ALIGN_LEFT);
            pdCell.setPaddingLeft(10);
            pdCell.setPaddingBottom(10);

            pdTable.addCell(pdCell);

            Paragraph cd = new Paragraph("CONTACT DETAILS", f);
            cd.setAlignment(Element.ALIGN_LEFT);

            PdfPTable cdTable = new PdfPTable(1);
            cdTable.setWidthPercentage(100);
            cdTable.setSpacingBefore(10f);
            cdTable.setSpacingAfter(5f);

            PdfPCell cdCell = new PdfPCell(cd);
            cdCell.setBorder(Rectangle.BOTTOM);
            cdCell.setBorderWidth(3);
            cdCell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cdCell.setVerticalAlignment(Element.ALIGN_LEFT);
            cdCell.setPaddingLeft(10);
            cdCell.setPaddingBottom(10);

            cdTable.addCell(cdCell);

            Paragraph po = new Paragraph("PAYMENT OPTION", f);
            po.setAlignment(Element.ALIGN_LEFT);

            PdfPTable poTable = new PdfPTable(1);
            poTable.setWidthPercentage(100);
            poTable.setSpacingBefore(10f);
            poTable.setSpacingAfter(5f);

            PdfPCell poCell = new PdfPCell(po);
            poCell.setBorder(Rectangle.BOTTOM);
            poCell.setBorderWidth(3);
            poCell.setHorizontalAlignment(Element.ALIGN_LEFT);
            poCell.setVerticalAlignment(Element.ALIGN_LEFT);
            poCell.setPaddingLeft(10);
            poCell.setPaddingBottom(10);

            poTable.addCell(poCell);

            Paragraph ft = new Paragraph(footer);
            ft.setAlignment(Element.ALIGN_RIGHT);

            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            PdfPTable table2 = new PdfPTable(3);
            table2.setWidthPercentage(100);
            table2.setWidths(new float[]{1.25f, 1.25f, 1.25f});
            table2.setSpacingBefore(10f);
            table2.setSpacingAfter(5f);

            PdfPTable table3 = new PdfPTable(1);
            table3.setWidthPercentage(100);
            table3.setSpacingBefore(10f);
            table3.setSpacingAfter(10f);

            PdfPTable table4 = new PdfPTable(2);
            table4.setWidthPercentage(100);
            table4.setSpacingBefore(10f);
            table4.setSpacingAfter(10f);

            PdfPTable table5 = new PdfPTable(1);
            table5.setWidthPercentage(100);
            table5.setSpacingBefore(10f);
            table5.setSpacingAfter(10f);

            PdfPCell c1 = new PdfPCell(new Paragraph("Username:", f2));
            c1.setBorder(Rectangle.NO_BORDER);
            c1.setHorizontalAlignment(Element.ALIGN_LEFT);
            c1.setVerticalAlignment(Element.ALIGN_LEFT);
            c1.setPaddingLeft(10);

            PdfPCell c2 = new PdfPCell(new Paragraph("Role:", f2));
            c2.setBorder(Rectangle.NO_BORDER);
            c2.setHorizontalAlignment(Element.ALIGN_LEFT);
            c2.setVerticalAlignment(Element.ALIGN_LEFT);
            c2.setPaddingLeft(10);

            PdfPCell c3 = new PdfPCell(new Paragraph("Given Name", f2));
            c3.setBorder(Rectangle.NO_BORDER);
            c3.setHorizontalAlignment(Element.ALIGN_LEFT);
            c3.setVerticalAlignment(Element.ALIGN_LEFT);
            c3.setPaddingLeft(10);

            PdfPCell c4 = new PdfPCell(new Paragraph("Middle Name", f2));
            c4.setBorder(Rectangle.NO_BORDER);
            c4.setHorizontalAlignment(Element.ALIGN_LEFT);
            c4.setVerticalAlignment(Element.ALIGN_LEFT);
            c4.setPaddingLeft(10);

            PdfPCell c5 = new PdfPCell(new Paragraph("Last Name", f2));
            c5.setBorder(Rectangle.NO_BORDER);
            c5.setHorizontalAlignment(Element.ALIGN_LEFT);
            c5.setVerticalAlignment(Element.ALIGN_LEFT);
            c5.setPaddingLeft(10);

            PdfPCell c6 = new PdfPCell(new Paragraph("Birthdate", f2));
            c6.setBorder(Rectangle.NO_BORDER);
            c6.setHorizontalAlignment(Element.ALIGN_LEFT);
            c6.setVerticalAlignment(Element.ALIGN_LEFT);
            c6.setPaddingLeft(10);

            PdfPCell c7 = new PdfPCell(new Paragraph("Contact Number", f2));
            c7.setBorder(Rectangle.NO_BORDER);
            c7.setHorizontalAlignment(Element.ALIGN_LEFT);
            c7.setVerticalAlignment(Element.ALIGN_LEFT);
            c7.setPaddingLeft(10);

            PdfPCell c8 = new PdfPCell(new Paragraph("Email", f2));
            c8.setBorder(Rectangle.NO_BORDER);
            c8.setHorizontalAlignment(Element.ALIGN_LEFT);
            c8.setVerticalAlignment(Element.ALIGN_LEFT);
            c8.setPaddingLeft(10);

            PdfPCell c9 = new PdfPCell(new Paragraph("Preferred Payment Option", f2));
            c9.setBorder(Rectangle.NO_BORDER);
            c9.setHorizontalAlignment(Element.ALIGN_LEFT);
            c9.setVerticalAlignment(Element.ALIGN_LEFT);
            c9.setPaddingLeft(10);

            table.addCell(c1);
            table.addCell(c2);

            table2.addCell(c3);
            table2.addCell(c4);
            table2.addCell(c5);
            table3.addCell(c6);

            table4.addCell(c7);
            table4.addCell(c8);

            table5.addCell(c9);

            while (rs.next()) {
                PdfPCell cell;

                cell = new PdfPCell(new Paragraph(rs.getString("username"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("role"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("given_name"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table2.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("middle_name"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table2.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("last_name"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table2.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("birthdate"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table3.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("contact_number"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table4.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("email"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table4.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("payment"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table5.addCell(cell);

//                table.addCell(userRecord);
//                table.addCell(userRole);
            }

            Paragraph pageDate = new Paragraph("Retrieved by " + user + " on " + date);
            pageDate.setAlignment(Element.ALIGN_RIGHT);

//            record.add(header);
            record.add(headerImg);
            record.add(adTable);
            record.add(table);
            record.add(pdTable);
            //record.add(new Paragraph(" "));
            record.add(table2);
            record.add(table3);
            record.add(cdTable);
            record.add(table4);
            record.add(poTable);
            record.add(table5);
            for (int i = 0; i < 10 - table.size(); i++) {
                record.add(new Paragraph(" "));
            }
            record.add(pageDate);
            record.add(ft);
            record.close();

        } catch (SQLException sqe) {
            sqe.printStackTrace();
        } catch (DocumentException de) {
            de.printStackTrace();
        } catch (IOException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pdf;
    }

    public ByteArrayOutputStream userRecord(ResultSet rs, String user, String footer, int numRecord, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        //String path = loader.getResource("/Pictures/logo_rectangle_transparent.png").getPath();

        Document record = new Document();
        record.setPageSize(PageSize.LETTER);
        ByteArrayOutputStream pdf = new ByteArrayOutputStream();

        try {

            PdfWriter.getInstance(record, pdf);

            record.open();

            for (int currentPage = 1; currentPage <= numRecord; currentPage++) {
                rs.next();
                Image headerImg = Image.getInstance(path);
                headerImg.setAlignment(Image.MIDDLE);
                headerImg.scaleToFit(200, 1000);
                Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
                Font f2 = new Font(Font.FontFamily.HELVETICA, 12);
                Font f3 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);

                Paragraph ad = new Paragraph("ACCOUNT DETAILS", f);
                ad.setAlignment(Element.ALIGN_LEFT);

                PdfPTable adTable = new PdfPTable(1);
                adTable.setWidthPercentage(100);
                adTable.setSpacingBefore(10f);
                adTable.setSpacingAfter(5f);

                PdfPCell adCell = new PdfPCell(ad);
                adCell.setBorder(Rectangle.BOTTOM);
                adCell.setBorderWidth(2);
                adCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                adCell.setVerticalAlignment(Element.ALIGN_LEFT);
                adCell.setPaddingLeft(10);
                adCell.setPaddingBottom(10);

                adTable.addCell(adCell);

                Paragraph pd = new Paragraph("PERSONAL DETAILS", f);
                pd.setAlignment(Element.ALIGN_LEFT);

                PdfPTable pdTable = new PdfPTable(1);
                pdTable.setWidthPercentage(100);
                pdTable.setSpacingBefore(10f);
                pdTable.setSpacingAfter(5f);

                PdfPCell pdCell = new PdfPCell(pd);
                pdCell.setBorder(Rectangle.BOTTOM);
                pdCell.setBorderWidth(2);
                pdCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                pdCell.setVerticalAlignment(Element.ALIGN_LEFT);
                pdCell.setPaddingLeft(10);
                pdCell.setPaddingBottom(10);

                pdTable.addCell(pdCell);

                Paragraph cd = new Paragraph("CONTACT DETAILS", f);
                cd.setAlignment(Element.ALIGN_LEFT);

                PdfPTable cdTable = new PdfPTable(1);
                cdTable.setWidthPercentage(100);
                cdTable.setSpacingBefore(10f);
                cdTable.setSpacingAfter(5f);

                PdfPCell cdCell = new PdfPCell(cd);
                cdCell.setBorder(Rectangle.BOTTOM);
                cdCell.setBorderWidth(2);
                cdCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cdCell.setVerticalAlignment(Element.ALIGN_LEFT);
                cdCell.setPaddingLeft(10);
                cdCell.setPaddingBottom(10);

                cdTable.addCell(cdCell);

                Paragraph po = new Paragraph("PAYMENT OPTION", f);
                po.setAlignment(Element.ALIGN_LEFT);

                PdfPTable poTable = new PdfPTable(1);
                poTable.setWidthPercentage(100);
                poTable.setSpacingBefore(10f);
                poTable.setSpacingAfter(5f);

                PdfPCell poCell = new PdfPCell(po);
                poCell.setBorder(Rectangle.BOTTOM);
                poCell.setBorderWidth(2);
                poCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                poCell.setVerticalAlignment(Element.ALIGN_LEFT);
                poCell.setPaddingLeft(10);
                poCell.setPaddingBottom(10);

                poTable.addCell(poCell);

                Paragraph ft = new Paragraph(footer);
                ft.setAlignment(Element.ALIGN_RIGHT);

                PdfPTable table = new PdfPTable(2);
                table.setWidthPercentage(100);
                table.setSpacingBefore(10f);
                table.setSpacingAfter(10f);

                PdfPTable table2 = new PdfPTable(3);
                table2.setWidthPercentage(100);
                table2.setWidths(new float[]{1.25f, 1.25f, 1.25f});
                table2.setSpacingBefore(10f);
                table2.setSpacingAfter(5f);

                PdfPTable table3 = new PdfPTable(1);
                table3.setWidthPercentage(100);
                table3.setSpacingBefore(10f);
                table3.setSpacingAfter(10f);

                PdfPTable table4 = new PdfPTable(2);
                table4.setWidthPercentage(100);
                table4.setSpacingBefore(10f);
                table4.setSpacingAfter(10f);

                PdfPTable table5 = new PdfPTable(1);
                table5.setWidthPercentage(100);
                table5.setSpacingBefore(10f);
                table5.setSpacingAfter(10f);

                PdfPCell c1 = new PdfPCell(new Paragraph("Username:", f2));
                c1.setBorder(Rectangle.NO_BORDER);
                c1.setHorizontalAlignment(Element.ALIGN_LEFT);
                c1.setVerticalAlignment(Element.ALIGN_LEFT);
                c1.setPaddingLeft(10);

                PdfPCell c2 = new PdfPCell(new Paragraph("Role:", f2));
                c2.setBorder(Rectangle.NO_BORDER);
                c2.setHorizontalAlignment(Element.ALIGN_LEFT);
                c2.setVerticalAlignment(Element.ALIGN_LEFT);
                c2.setPaddingLeft(10);

                PdfPCell c3 = new PdfPCell(new Paragraph("Given Name", f2));
                c3.setBorder(Rectangle.NO_BORDER);
                c3.setHorizontalAlignment(Element.ALIGN_LEFT);
                c3.setVerticalAlignment(Element.ALIGN_LEFT);
                c3.setPaddingLeft(10);

                PdfPCell c4 = new PdfPCell(new Paragraph("Middle Name", f2));
                c4.setBorder(Rectangle.NO_BORDER);
                c4.setHorizontalAlignment(Element.ALIGN_LEFT);
                c4.setVerticalAlignment(Element.ALIGN_LEFT);
                c4.setPaddingLeft(10);

                PdfPCell c5 = new PdfPCell(new Paragraph("Last Name", f2));
                c5.setBorder(Rectangle.NO_BORDER);
                c5.setHorizontalAlignment(Element.ALIGN_LEFT);
                c5.setVerticalAlignment(Element.ALIGN_LEFT);
                c5.setPaddingLeft(10);

                PdfPCell c6 = new PdfPCell(new Paragraph("Birthdate", f2));
                c6.setBorder(Rectangle.NO_BORDER);
                c6.setHorizontalAlignment(Element.ALIGN_LEFT);
                c6.setVerticalAlignment(Element.ALIGN_LEFT);
                c6.setPaddingLeft(10);

                PdfPCell c7 = new PdfPCell(new Paragraph("Contact Number", f2));
                c7.setBorder(Rectangle.NO_BORDER);
                c7.setHorizontalAlignment(Element.ALIGN_LEFT);
                c7.setVerticalAlignment(Element.ALIGN_LEFT);
                c7.setPaddingLeft(10);

                PdfPCell c8 = new PdfPCell(new Paragraph("Email", f2));
                c8.setBorder(Rectangle.NO_BORDER);
                c8.setHorizontalAlignment(Element.ALIGN_LEFT);
                c8.setVerticalAlignment(Element.ALIGN_LEFT);
                c8.setPaddingLeft(10);

                PdfPCell c9 = new PdfPCell(new Paragraph("Preferred Payment Option", f2));
                c9.setBorder(Rectangle.NO_BORDER);
                c9.setHorizontalAlignment(Element.ALIGN_LEFT);
                c9.setVerticalAlignment(Element.ALIGN_LEFT);
                c9.setPaddingLeft(10);

                table.addCell(c1);
                table.addCell(c2);

                table2.addCell(c3);
                table2.addCell(c4);
                table2.addCell(c5);
                table3.addCell(c6);

                table4.addCell(c7);
                table4.addCell(c8);

                table5.addCell(c9);

                PdfPCell cell;

                cell = new PdfPCell(new Paragraph(rs.getString("username"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("role"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("given_name"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table2.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("middle_name"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table2.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("last_name"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table2.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("birthdate"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table3.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("contact_number"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table4.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("email"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table4.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("payment"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setPaddingLeft(10);
                table5.addCell(cell);

                String pagination = String.format("Page %d of %d", currentPage, numRecord);
                Paragraph pageDate = new Paragraph("Retrieved by " + user + " on " + date + " | " + pagination);
                pageDate.setAlignment(Element.ALIGN_RIGHT);

//            record.add(header);
                record.add(headerImg);
                record.add(adTable);
                record.add(table);
                record.add(pdTable);
                //record.add(new Paragraph(" "));
                record.add(table2);
                record.add(table3);
                record.add(cdTable);
                record.add(table4);
                record.add(poTable);
                record.add(table5);
                for (int i = 0; i < 10 - table.size(); i++) {
                    record.add(new Paragraph(" "));
                }

                record.add(pageDate);
                record.add(ft);
            }
            record.newPage();

            record.close();

        } catch (SQLException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pdf;
    }
}
