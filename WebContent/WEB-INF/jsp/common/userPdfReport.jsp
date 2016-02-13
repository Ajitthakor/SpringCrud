<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>pdf Report</title>
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
				<li><a href="#">Report</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="box col-md-12">
				<div class="box-inner">
					<div class="box-header well" data-original-title="">
						<h2 class="animated rubberBand">
							<i class="glyphicon glyphicon-list"></i>User Report
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
						<form:form method="get" name="" commandName="viewsuser"
							action="search">
							<table>
								<tr>
									<td>
										<div class="control-group">

											<label for="selectError">Select User Name:</label> <label
												style="color: red;" id="l12" name="l12"></label>
											<div class="controls">

												<select id="uid" name="uid" data-rel="chosen"
													style="width: 220px; height: 8px;"
													onblur="combobox(this.value);">
													<option value="-1">--------- Select User
														Name-------</option>
													<c:forEach items="${viewsuser1}" var="viewsuser1">
														<option value="${viewsuser1.uid}">${viewsuser1.uname}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</td>
									<td style="min-height: 1px;">

										<div class="col-md-6"
											style="min-width: 142px; left: -15px; margin-bottom: -23px;">
											<button type="submit" name="submit" value="Search"
												class="btn btn-success btn-sm btn-block">
												<span class="glyphicon glyphicon-zoom-in icon-white"></span>Search
											</button>

										</div>

									</td>
									<td>
										<div style="margin-left: 171px;">
											<button data-toggle="tooltip"
												data-original-title="Generate PDF Report" type="submit" name="submit" style="border: none;"
												value="pdf">
												<img alt="pdf" src="img/pdf.png">
											</button>
										</div>
									</td>
									<td>
										<div style="margin-left: -12px;">
											<button data-toggle="tooltip"
												data-original-title="Generate Excel Report" type="submit" name="submit" style="border: none;"
												value="excel">
												<img alt="excel" src="img/logo-excel.png" style="width: 62px;">
											</button>
										</div>
									</td>
								</tr>
							</table>
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable responsive"
								width="953px">
								<thead>
									<tr style="background: #0099FF; min-width: 150px;">
									<tr style="background: #0099FF">
										<th>Uid</th>
										<th>User Name</th>
										<th>City</th>
										<th>State</th>
										<th>Country</th>
										<th>Pin Code</th>
										<th>Email ID</th>
										<th>Mobile Number</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${viewsuser}" var="viewsuser">
										<tr>
											<td>${viewsuser.uid}</td>
											<td>${viewsuser.uname}</td>
											<td>${viewsuser.city}</td>
											<td>${viewsuser.state}</td>
											<td>${viewsuser.country}</td>
											<td>${viewsuser.pinCode}</td>
											<td>${viewsuser.email}</td>
											<td>${viewsuser.mobileNumber}</td>
										</tr>
									</c:forEach>
									<!--  -->

								</tbody>
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

