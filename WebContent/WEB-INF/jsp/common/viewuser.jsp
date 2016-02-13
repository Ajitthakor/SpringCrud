<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>View User</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script type='text/javascript' src='jquery.min.js'></script>

<script type="text/javascript">
	function confirmation() {
		if (confirm("Are you sure to Delete Recored?")) {
			return true;
		} else {
			return false;
		}
	}
</script>
<!-- The fav icon -->
<link rel="shortcut icon" href="img/softweb_logo@2x.png">
</head>

<body>
	<!-- left menu ends -->
	<jsp:include page="leftmenu.jsp"></jsp:include>
	<!-- left menu ends -->
	<div id="content" class="col-lg-10 col-sm-10">
		<!-- content starts -->
		<div>
			<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li><a href="ViewsUser">Views-User</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="box col-md-12">
				<div class="box-inner">
					<div class="box-header well" data-original-title="">
						<h2 class="animated rubberBand">
							<i class="glyphicon glyphicon-list"></i> Views-User
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
					<div class="box-content" style="margin-left: 54px;">
						<form:form method="post" commandName="user" action="ViewsUser"
							id="user">
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable responsive"
								width="953px">
								<thead>
									<tr style="background: #0099FF">
										<th>User Name</th>
										<!-- <th>Role</th> -->
										<th>City</th>
										<th>State</th>
										<th>Country</th>
										<th>Pin Code</th>
										<th>Email ID</th>
										<th>Mobile Number</th>
										
										<security:authorize access="hasRole('ROLE_ADMIN')"><th>Actions</th></security:authorize>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${viewsuser}" var="userbean">
										<tr>
											<td>${userbean.uname}</td>
											<%-- <td>${userbean.role}</td> --%>
											<td>${userbean.city}</td>
											<td>${userbean.country}</td>
											<td>${userbean.state}</td>
											<td class="center">${userbean.pinCode}</td>
											<td class="center">${userbean.email}</td>
											<td class="center"><span class="center">${userbean.mobileNumber}</span>
											</td>
											<security:authorize access="hasRole('ROLE_ADMIN')">
											<td class="center">
											
											<a class="btn btn-info"
												data-toggle="modal" title="" data-toggle="tooltip"
												class="btn btn-warning"
												data-original-title="Here You Can Update The Record"
												data-target="#myModal" href="editUser?uid=${userbean.uid}">
													<i class="glyphicon glyphicon-edit icon-white"></i> Edit
											</a>
											 <a class="btn btn-danger" title="" 
											 	data-toggle="tooltip"
												class="btn btn-warning"
												data-original-title="Here You Can Delete The Record"
												href="deleteUser?uid=${userbean.uid}"
												onclick="return confirmation();"
												>
												 <i
													class="glyphicon glyphicon-trash icon-white"></i> Delete
											</a>
											</td>
											</security:authorize>
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
	<!--/.fluid-container-->
	<!-- external javascript -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>