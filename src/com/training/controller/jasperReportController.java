package com.training.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.training.service.userservice;

import net.sf.jasperreports.engine.JRDataSource;

@Controller
public class jasperReportController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Autowired
	userservice userservice;
	
	protected static Logger logger = Logger.getLogger("controller");

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ModelAndView Loading(HttpServletRequest request, HttpSession session) {
		
		ModelAndView modelandmap = new ModelAndView("common/DownloadJasperReport");
		logger.debug("Received request to show download page");
		return modelandmap;
		
	}
	@RequestMapping(value = "/xlsReport", method = RequestMethod.GET)
	public ModelAndView doSalesReportXLS(ModelAndView modelAndView,HttpServletRequest request) {
		logger.debug("Received request to download Excel report");
		
		JRDataSource datasource = userservice.getDataSource();
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("datasource", datasource);
		modelAndView = new ModelAndView("xlsReport", parameterMap);
		
		return modelAndView;
	}

	@RequestMapping(value = "/pdfReport", method = RequestMethod.GET)
	public ModelAndView doSalesReportPDF(ModelAndView modelAndView,HttpServletRequest request) {
		logger.debug("Received request to download PDF report");
		
		JRDataSource datasource = userservice.getDataSource();
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("datasource", datasource);
		modelAndView = new ModelAndView("pdfReport", parameterMap);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/csvReport", method = RequestMethod.GET)
	public ModelAndView generateCsvReport(ModelAndView modelAndView) {

		Map<String, Object> parameterMap = new HashMap<String, Object>();
		JRDataSource JRdataSource = userservice.getDataSource();
		
		parameterMap.put("datasource", JRdataSource);
		modelAndView = new ModelAndView("csvReport", parameterMap);

		return modelAndView;

	}
	@RequestMapping(value = "/htmlReport", method = RequestMethod.GET)
	public ModelAndView generateHtmlReport(ModelAndView modelAndView) {

		Map<String, Object> parameterMap = new HashMap<String, Object>();
		JRDataSource JRdataSource = userservice.getDataSource();
		
		parameterMap.put("datasource", JRdataSource);
		modelAndView = new ModelAndView("htmlReport", parameterMap);

		return modelAndView;

	}


}
