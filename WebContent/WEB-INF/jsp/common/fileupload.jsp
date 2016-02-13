<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Upload File</title>
<style type="text/css">
.error {
	color: red;
}
</style>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="js/fileUploadScript.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!-- The fav icon -->
<link rel="shortcut icon" href="img/softweb_logo@2x.png">
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<script type='text/javascript' src='jquery.min.js'></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
	function Checkfiles() {
		var fup = document.getElementById('myfile');
		var filename = fup.value;
		var ext = filename.substring(filename.lastIndexOf('.') + 1);
		if (ext == "jpg" || ext == "png" || ext == "gif" || ext == "JPG"
				|| ext == "PNG" || ext == "GIF") {
			$('#ajax_div').html('<img src="img/progressbar.gif">');
			setTimeout(function() {
				$('#ajax_div');
			}, 2000);
			return true;
		} else {
			alert("Upload JPG,PNG or GIF files only");
			fup.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<!-- left menu  -->
	<jsp:include page="leftmenu.jsp"></jsp:include>
	<!-- left menu ends -->
	<div id="content" class="col-lg-10 col-sm-10">
		<!-- content starts -->
		<div>
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li><a href="#">Upload File</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="box col-md-12">
				<div class="box-inner">
					<div class="box-header well">
						<h2 class="animated rubberBand">
							<i class=" glyphicon glyphicon-plus-sign"></i>Upload File
						</h2>

						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round btn-default"><i
								class="glyphicon glyphicon-cog"></i> </a> <a href="#"
								class="btn btn-minimize btn-round btn-default"><i
								class="glyphicon glyphicon-chevron-up"></i> </a> <a href="#"
								class="btn btn-close btn-round btn-default"><i
								class="glyphicon glyphicon-remove"></i> </a>
						</div>
					</div>
					<div class="box-content row">
						<div class="col-lg-7 col-md-12">
							<form:form id="UploadForm" method="post" commandName="fileUpload"
								action="uploadImg" name="frm" enctype="multipart/form-data"
								onsubmit="return Checkfiles(this);">
								<div class="box-content">
									<div class="input-group input-group-lg">
										<table>
											<tr>
												<th>Enter File Name To Upload:</th>
											</tr>
											<tr>
												<td><input type="file" id="myfile" name="myfile"
													class="form-control"
													placeholder="Eter File Name To be Upload" /></td>
												<td>
													<button id="ajax_bt"
														class="btn btn-primary btn-sm glyphicon glyphicon-upload"
														style="min-height: 38px; min-width: 100px;" type="submit">Upload</button>
												</td>
											</tr>
										</table>
										<div id="ajax_div" style="padding: 10px;"></div>
									<!-- </div>
								</div> -->
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="row">
		<p style="margin-left: 29px;">
			Powered by: <a href="#">N-Xpert Solution PVT.LTD</a>
		</p>
	</footer>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

