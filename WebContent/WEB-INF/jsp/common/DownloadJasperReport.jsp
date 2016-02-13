<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Jasper Report</title>
<!-- The styles -->
<link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">
<link href="css/charisma-app.css" rel="stylesheet">
<link href='bower_components/fullcalendar/dist/fullcalendar.css'
	rel='stylesheet'>
<link href='bower_components/fullcalendar/dist/fullcalendar.print.css'
	rel='stylesheet' media='print'>
<link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
<link href='bower_components/colorbox/example3/colorbox.css'
	rel='stylesheet'>
<link href='bower_components/responsive-tables/responsive-tables.css'
	rel='stylesheet'>
<link
	href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css'
	rel='stylesheet'>
<link href='css/jquery.noty.css' rel='stylesheet'>
<link href='css/noty_theme_default.css' rel='stylesheet'>
<link href='css/elfinder.min.css' rel='stylesheet'>
<link href='css/elfinder.theme.css' rel='stylesheet'>
<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='css/uploadify.css' rel='stylesheet'>
<link href='css/animate.min.css' rel='stylesheet'>
<!-- jQuery -->
<script src="bower_components/jquery/jquery.min.js"></script>
<!-- The fav icon -->
<link rel="shortcut icon" href="img/softweb_logo@2x.png">
</head>

<body>
	<!-- left menu starts -->
	<jsp:include page="leftmenu.jsp"></jsp:include>
	<!-- left menu ends -->
	<div id="content" class="col-lg-10 col-sm-10">
		<!-- content starts -->
		<div>
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li><a href="#">Jasper Report</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="box col-md-12">
				<div class="box-inner">
					<div class="box-header well" data-original-title="">
						<h2 class="animated rubberBand">
							<i class="glyphicon glyphicon-list"></i>Jasper Report
						</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round btn-default"><i
								class="glyphicon glyphicon-cog"></i></a> <a href="#"
								class="btn btn-minimize btn-round btn-default"><i
								class="glyphicon glyphicon-chevron-up"></i></a> <a href="#"
								class="btn btn-close btn-round btn-default"><i
								class="glyphicon glyphicon-remove"></i></a>
						</div>
					</div>
					<div class="box-content" style="margin-left: 19px;">
					<form:form method="get" name="" commandName=" " action="">
						<table>
						<%-- <tr>
									<td>
										<div class="control-group">

											<label for="selectError">Select User Name:</label>
											<div class="controls">
												<select id="uid" name="uid" data-rel="chosen"
													style="width: 220px; height: 8px;">
													<option value="-1">--------- Select User
														Name-------</option>
													<c:forEach items="${viewsuser}" var="viewsuser">
														<option value="${viewsuser.uid}">${viewsuser.uid},${viewsuser.uname}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</td>
									</tr> --%>
							<tr>
								<td class="center">
								<c:url value="/xlsReport" var="downloadXls" /> 
								
								<a class="btn btn-info"
									data-toggle="modal" title="" data-toggle="tooltip"
									class="btn btn-warning"
									data-original-title="Here You Can Download Excel Report"
									 href="${downloadXls}" style="width: 220px;"> <i
										class="glyphicon glyphicon-edit icon-white"></i> Download
										Excel
								</a></td>
							</tr>
							<tr>
								<td class="center">
								<c:url value="/pdfReport" var="downloadPdf" /> 
								
								<a class="btn btn-info"
									data-toggle="modal" title="" data-toggle="tooltip"
									class="btn btn-warning"
									data-original-title="Here You Can Download pdf Report"
									 href="${downloadPdf}" style="width:220px;"> <i
										class="glyphicon glyphicon-edit icon-white"></i> Download PDF
								</a></td>
							</tr>
							<tr>
								<td class="center">
								<c:url value="/csvReport" var="downloadCsv"/>
								<a class="btn btn-info"
									data-toggle="modal" title="" data-toggle="tooltip"
									class="btn btn-warning"
									data-original-title="Here You Can Download csv Report"
									 href="${downloadCsv}" style="width: 220px;"> <i
										class="glyphicon glyphicon-edit icon-white"></i> Download CSV
								</a></td>
							</tr>
							<tr>
								<td class="center">
								<c:url value="/htmlReport" var="downloadHtml"/>
								<a class="btn btn-info"
									data-toggle="modal" title="" data-toggle="tooltip"
									class="btn btn-warning"
									data-original-title="Here You Can Download Html Report"
									 href="${downloadHtml}" style="width:220px;"> <i
										class="glyphicon glyphicon-edit icon-white"></i> Download HTML
								</a></td>
							</tr>

						</table>
						</form:form>

					</div>
				</div>
			</div>
			<!--/span-->
		</div>
		<!--/row-->
		<footer class="row">
			<p style="margin-left: 17px;">
				Powered by: <a href="#">N-Xpert Solution PVT.LTD</a>
			</p>
		</footer>
		<!-- Model -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
		<!-- /Model -->
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

