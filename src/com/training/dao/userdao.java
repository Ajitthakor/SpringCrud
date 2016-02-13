package com.training.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.training.bean.user;

import net.sf.jasperreports.engine.JRDataSource;

public interface userdao {

	public String createUser(user user);
	public user getcurruntUser(String email, String password);
	public List<user> getUserList();
	public void deleteUser(int uid);
	public user updateUser(int uid);
	public void sendmail(String recipientAddress, String message);
	
	public List<user> getUserist(HttpServletResponse response, int uid);
	public List<user> getUserList(int uid);
	public List<user> forgotpass(String email);
	public List<user> getUserlistExcel(HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response,
			int uid);
	
	/* Method for the jasper report */
	
	public  JRDataSource getDataSource();
}