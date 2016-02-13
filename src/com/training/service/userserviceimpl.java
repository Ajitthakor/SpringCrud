package com.training.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.training.bean.user;
import com.training.dao.userdao;

import net.sf.jasperreports.engine.JRDataSource;

@Service("userservice")
@Transactional
public class userserviceimpl implements userservice {

	@Autowired
	userdao userDao;
	@Autowired
	SessionFactory sessionfact;

	@Override
	public String createUser(user user) {
		return userDao.createUser(user);
	}

	@Override
	public user getcurruntUser(String email, String password) {
		return userDao.getcurruntUser(email, password);
	}

	@Override
	public List<user> getUserList() {
		return userDao.getUserList();
	}

	@Override
	public void deleteUser(int uid) {
		userDao.deleteUser(uid);
	}

	@Override
	public user updateUser(int uid) {
		return userDao.updateUser(uid);
	}

	@Override
	public void sendmail(String recipientAddress, String message) {
		userDao.sendmail(recipientAddress, message);

	}

	@Override
	public List<user> getUserist(HttpServletResponse response, int uid) {
		return userDao.getUserist(response, uid);
	}

	@Override
	public List<user> getUserList(int uid) {
		return userDao.getUserList(uid);
	}

	@Override
	public List<user> forgotpass(String email) {

		return userDao.forgotpass(email);
	}

	@Override
	public List<user> getUserlistExcel(HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response,
			int uid) {
		return userDao.getUserlistExcel(workbook, request, response, uid);
	}
	
	// ---------------------------------------------------------
	
	@Override
	public JRDataSource getDataSource() {

		return userDao.getDataSource();
	}
}
