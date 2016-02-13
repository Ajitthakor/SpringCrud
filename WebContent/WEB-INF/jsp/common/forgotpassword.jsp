<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css" />

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
<script type="text/javascript">
	function Email(val) {
		var email = frm.email;
		var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

		if (!(frm.email.value.match(reg))) {
			document.getElementById("l1").innerHTML = "<p class='glyphicon glyphicon-warning-sign'>Enter Valid Email Address..!</p>";
			return false;
		} else {
			document.getElementById("l1").innerHTML = " ";

		}
	}
</script>


<body>
	<div class="box-content row">
		<div class="col-lg-7 col-md-12">
			<div class=" vd_bg-blue ">

				<h3>Forgot Password..!</h3>
				<!-- <button type="button" class="close" data-dismiss="modal"
					style="margin-left: 500px;">×</button> -->
			</div>
			<br>
			<form:form commandName="forgotpass" action="sendPassword"
				method="get" name="frm" onsubmit="return Email(this.value);">

				<label for="selectError" style="margin-left: -142px;">Enter
					Email-Address:</label>

				<div class="input-group input-group-lg">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-envelope"></i></span> 
						<input type="email" id="email" name="email" required class="form-control"
						placeholder="Enter User Email-Address" style="width: 417px;" />
				</div>
				<label style="color: red;" id="l1"></label>
				<br>
				<div class="col-md-6" style="width: 142px; left: -15px;"
					align="center">
					<button type="submit" class="btn btn-success btn-sm btn-block"
						style="margin-left: 181px;">
						<span class="glyphicon  glyphicon glyphicon-edit"></span>Send
					</button>
				</div>
				<p>
					<label style="width: initial; color: red">${msg}</label>
				</p>
			</form:form>

		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>