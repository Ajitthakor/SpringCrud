<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Left Menu</title>
</head>
<body>
	<!-- topbar starts -->
	<div class="navbar navbar-default" role="navigation">

		<div class="navbar-inner">
			<button type="button" class="navbar-toggle pull-left animated flip">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp"> <img alt="priya Logo"
				src="img/logo_soft.jpeg" class="hidden-xs" style="width: 196px" />
			</a>

			<!-- user dropdown starts -->
			<div class="btn-group pull-right" style="margin-right: 19px;">
				<button class="btn btn-default dropdown-toggle"
					data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i><span
						class="hidden-sm hidden-xs"> Welcome:${userdata.email}${author}</span> <span
						class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">Profile</a></li>
					<li class="divider"></li>
					<li><a href="login">Logout</a></li>
				</ul>
			</div>
			<!-- user dropdown ends -->

			<!-- theme selector starts -->
			<div class="btn-group pull-right theme-container animated tada">
				<button class="btn btn-default dropdown-toggle"
					data-toggle="dropdown">
					<i class="glyphicon glyphicon-tint"></i><span
						class="hidden-sm hidden-xs"> Change Theme / Skin</span> <span
						class="caret"></span>
				</button>
				<ul class="dropdown-menu" id="themes">
					<li><a data-value="classic" href="#"><i class="whitespace"></i>
							Classic</a></li>
					<li><a data-value="cerulean" href="#"><i
							class="whitespace"></i> Cerulean</a></li>
					<li><a data-value="cyborg" href="#"><i class="whitespace"></i>
							Cyborg</a></li>
					<li><a data-value="simplex" href="#"><i class="whitespace"></i>
							Simplex</a></li>
					<li><a data-value="darkly" href="#"><i class="whitespace"></i>
							Darkly</a></li>
					<li><a data-value="lumen" href="#"><i class="whitespace"></i>
							Lumen</a></li>
					<li><a data-value="slate" href="#"><i class="whitespace"></i>
							Slate</a></li>
					<li><a data-value="spacelab" href="#"><i
							class="whitespace"></i> Spacelab</a></li>
					<li><a data-value="united" href="#"><i class="whitespace"></i>
							United</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- topbar ends -->
	<div class="ch-container">
		<div class="row">
			<div class="col-sm-2 col-lg-2">
				<div class="sidebar-nav">
					<div class="nav-canvas">
						<div class="nav-sm nav nav-stacked"></div>
						<ul class="nav nav-pills nav-stacked main-menu">
							<li class="nav-header" style="margin-left: 49px;">Main</li>
							<li><a class="ajax-link" href="home"><i
									class="glyphicon glyphicon-home"></i><span> Dashboard</span> </a></li>
							<li><a class="ajax-link" href="createUser"><i
									class="glyphicon glyphicon-edit"></i><span> Add New User
								</span> </a></li>
							<li><a class="ajax-link" href="ViewsUser"><i
									class="glyphicon glyphicon-eye-open"></i><span>
										Views-User</span> </a></li>
							<li><a class="ajax-link" href="uploadFile"><i
									class="glyphicon glyphicon glyphicon-upload"></i><span>
										File Upload</span> </a></li>
							<li><a class="ajax-link" href="userPdfReport"><i
									class="glyphicon glyphicon-leaf"></i><span> User Report</span>
							</a></li>
							<li><a class="ajax-link" href="download"><i
									class="glyphicon glyphicon-leaf"></i><span> Jasper Report</span>
							</a></li>
							<li><a class="ajax-link" href="gallary"><i
									class="glyphicon glyphicon-picture"></i><span>Gallary</span> </a></li>

							<li><a class="ajax-link" href="contactus"><i
									class=" glyphicon glyphicon-tint"></i><span>Contact Us</span> </a></li>
						</ul>
					</div>
				</div>
			</div>
</body>
</html>