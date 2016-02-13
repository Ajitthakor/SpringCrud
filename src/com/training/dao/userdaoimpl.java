package com.training.dao;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.training.bean.courses;
import com.training.bean.user;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Repository("userdao")
public class userdaoimpl implements userdao {

	@Autowired
	SessionFactory sessionfact;
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public String createUser(user user) {

		courses c = new courses(1, "xyz", "xyz");

		c.setCid(1);
		c.setCourseName("xyz");
		c.setDuration("abc");

		c.getUser().add(user);

		/*
		 * c.getUser().remove(user); user.getCourse().remove(c);
		 */
		user.getCourse().add(c);

		sessionfact.getCurrentSession().save(c);
		sessionfact.getCurrentSession().saveOrUpdate(user);

		return "Record Save.......";

	}

	@Override
	public user getcurruntUser(String email, String password) {
		Query qu = (Query) sessionfact.getCurrentSession()
				.createQuery("from user where email=:email and password=:password");
		qu.setParameter("email", email);
		qu.setParameter("password", password);
		user u = (user) qu.uniqueResult();
		return u;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<user> getUserList() {
		List<user> userLlist = new ArrayList<user>();
		Query query = (Query) sessionfact.getCurrentSession().createQuery("from user");
		userLlist = query.list();
		return userLlist;
	}

	@Override
	public void deleteUser(int uid) {

		user user = null;
		user = (user) sessionfact.getCurrentSession().get(user.class, uid);
		sessionfact.getCurrentSession().delete(user);

	}

	@Override
	public user updateUser(int uid) {
		user user = null;
		user = (user) sessionfact.getCurrentSession().get(user.class, uid);
		return user;

	}

	@Override
	public void sendmail(String recipientAddress, String message) {
		System.out.println("message:-" + message);
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		try {

			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
			mimeMessage.setContent(message, "text/html");
			helper.setTo(recipientAddress);
			mailSender.send(mimeMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<user> getUserist(HttpServletResponse response, int uid) {

		Criteria criteria = sessionfact.getCurrentSession().createCriteria(user.class).add(Restrictions.eq("uid", uid));
		@SuppressWarnings("unchecked")
		List<user> userlist = criteria.list();

		// HttpServletResponse response=null;

		String str = "pdf";
		try {

			/*
			 * java.io.OutputStream file =new FileOutputStream(new
			 * File("D:\\Test.pdf"));
			 * 
			 * Document document = new Document();
			 * PdfWriter.getInstance(document, file);
			 */

			Document document = new Document();
			if (str.equals("pdf")) {
				response.setContentType("application/pdf");
				PdfWriter.getInstance(document, response.getOutputStream());
			}

			document.open();
			document.addTitle("User Detail Report");

			// define table column just like 8

			PdfPTable table = new PdfPTable(8);
			table.setWidthPercentage(100.0f);
			table.setWidths(new float[] { 1.5f, 2.5f, 2.5f, 3.5f, 2.5f, 2.5f, 5.5f, 5.5f });
			table.setSpacingBefore(10);

			Font font = FontFactory.getFont(FontFactory.HELVETICA);
			font.setColor(BaseColor.BLUE);

			// define table header cell
			PdfPCell cell = new PdfPCell();

			cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			cell.setPadding(5);

			cell.setPhrase(new Phrase("Uid"));
			table.addCell(cell);

			cell.setPhrase(new Phrase("User Name"));
			table.addCell(cell);

			cell.setPhrase(new Phrase("City"));
			table.addCell(cell);
			cell.setPhrase(new Phrase("State"));
			table.addCell(cell);
			cell.setPhrase(new Phrase("Country"));
			table.addCell(cell);

			cell.setPhrase(new Phrase("Pin Code"));
			table.addCell(cell);

			cell.setPhrase(new Phrase("EmailID"));
			table.addCell(cell);

			cell.setPhrase(new Phrase("Mobile Number"));
			table.addCell(cell);

			for (user rec : userlist) {
				table.addCell("" + rec.getUid());
				table.addCell(rec.getUname());
				table.addCell(rec.getCity());
				table.addCell(rec.getState());
				table.addCell(rec.getCountry());
				table.addCell(rec.getPinCode());
				table.addCell(rec.getEmail());
				table.addCell(rec.getMobileNumber());
			}
			document.open();
			document.add(new Paragraph(
					"---------------------------------------------------User Deatil REPORT---------------------------------------------------\n"));
			document.addCreationDate();
			document.add(table);
			document.close();
		} catch (Exception e) {
		}
		return userlist;
	}

	@Override
	public List<user> getUserList(int uid) {

		Criteria criteria = sessionfact.getCurrentSession().createCriteria(user.class).add(Restrictions.eq("uid", uid));
		@SuppressWarnings("unchecked")
		List<user> userlist = criteria.list();
		return userlist;
	}

	@Override
	public List<user> forgotpass(String email) {

		String hql = "SELECT password FROM user where email='" + email + "'";

		System.out.println("Query:--->" + hql);
		SQLQuery query = sessionfact.getCurrentSession().createSQLQuery(hql);
		System.out.println("Sql Query:->" + query);

		@SuppressWarnings("unchecked")
		List<user> pass = query.list();
		System.out.println("PassLIST:-->" + pass);

		Iterator<user> iterator = pass.iterator();
		while (iterator.hasNext()) {
			iterator.next();
		}
		return pass;
	}

	@Override
	public List<user> getUserlistExcel(HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response,
			int uid) {

		Criteria criteria = sessionfact.getCurrentSession().createCriteria(user.class).add(Restrictions.eq("uid", uid));
		@SuppressWarnings("unchecked")
		List<user> listuser = criteria.list();

		try {
			String path = request.getServletContext().getRealPath("/WebContent/excelReport/");

			if (null != path && path.length() > 0) {
				int endIndex = path.lastIndexOf("/.metadata");

				String newstr = path.substring(0, endIndex);
				String excelfile = newstr + "/Spring_Crud/WebContent/excelReport/userInfo.xls";

				FileOutputStream fileOut = new FileOutputStream(excelfile);

				// create a new Excel sheet
				HSSFSheet sheet = workbook.createSheet("User Info");
				sheet.setDefaultColumnWidth(30);

				// create style for header cells
				HSSFCellStyle style = workbook.createCellStyle();
				HSSFFont font = workbook.createFont();
				font.setFontName("Arial");
				style.setFillForegroundColor(HSSFColor.BLUE.index);
				style.setFillPattern(CellStyle.SOLID_FOREGROUND);
				font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
				font.setColor(HSSFColor.WHITE.index);
				style.setFont(font);

				// create header row
				HSSFRow header = sheet.createRow(0);

				header.createCell(0).setCellValue("Uid");
				header.getCell(0).setCellStyle((HSSFCellStyle) style);

				header.createCell(1).setCellValue("UserName");
				header.getCell(1).setCellStyle(style);

				header.createCell(2).setCellValue("City");
				header.getCell(2).setCellStyle(style);

				header.createCell(3).setCellValue("State");
				header.getCell(3).setCellStyle(style);

				header.createCell(4).setCellValue("Country");
				header.getCell(4).setCellStyle(style);

				header.createCell(5).setCellValue("Pincode");
				header.getCell(5).setCellStyle(style);

				header.createCell(6).setCellValue("Email");
				header.getCell(6).setCellStyle(style);

				header.createCell(7).setCellValue("Mobile Number");
				header.getCell(7).setCellStyle(style);

				// create data rows
				int rowCount = 1;

				for (user user : listuser) {
					HSSFRow aRow = sheet.createRow(rowCount++);
					aRow.createCell(0).setCellValue(user.getUid());
					aRow.createCell(1).setCellValue(user.getUname());
					aRow.createCell(2).setCellValue(user.getCity());
					aRow.createCell(3).setCellValue(user.getState());
					aRow.createCell(4).setCellValue(user.getCountry());
					aRow.createCell(5).setCellValue(user.getPinCode());
					aRow.createCell(6).setCellValue(user.getEmail());
					aRow.createCell(7).setCellValue(user.getMobileNumber());
				}
				workbook.write(fileOut);
				fileOut.flush();
				fileOut.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return listuser;
	}

	@SuppressWarnings("unchecked")
	@Override
	public JRDataSource getDataSource() {

		List<user> items = new ArrayList<user>();
		Query query = (Query) sessionfact.getCurrentSession().createQuery("from user");
		items = query.list();

		user item1 = new user();

		item1.setUid(item1.getUid());
		System.out.println("uid Of GetSource Method:->" + item1.getUid());
		item1.setUname(item1.getUname());
		item1.setCity(item1.getCity());
		item1.setState(item1.getState());
		item1.setCountry(item1.getCountry());

		items.add(item1);

		JRDataSource ds = new JRBeanCollectionDataSource(items);

		return ds;

	}

}