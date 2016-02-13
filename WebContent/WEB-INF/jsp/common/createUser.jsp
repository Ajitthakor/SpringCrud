<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Add New User</title>
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
<script type='text/javascript' src='jquery.min.js'></script>
<script type='text/javascript' src='js/countries.js'></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	/* Ajax Validation */
	/* reqObj=null;
	    function varify(){
	        document.getElementById("l1").innerHTML="Checking";
	        if(window.XMLHttpRequest){
	            reqObj=new XMLHttpRequest();
	        }else {
	            reqObj=new ActiveXObject("Microsoft.XMLHTTP");
	        }
	        
	        reqObj.onreadystatechange=process;
	        reqObj.open("POST","?uid="+document.getElementById("uname").value,true);
	        reqObj.send(null);
	    }
	    function process(){
	        if(reqObj.readyState==4){
	            document.getElementById("l1").innerHTML=reqObj.responseText;
	        }
	    } */

	/* javaScript Validation */
	function Uname(val) {
		var uname = frm.uname;
		if (uname.value == "" || uname.value == null) {
			document.getElementById("l1").innerHTML = "<p class='glyphicon glyphicon-warning-sign'>Enter User name..!</p>";
			return true;
		} else {
			document.getElementById('l1').innerHTML = "";
		}

	}
	function City(val) {
		var city = frm.city;
		if (city.value == "" || city.value == null) {
			document.getElementById("l2").innerHTML = "<p class='glyphicon glyphicon-warning-sign'>Enter City Name..!</p>";
			return true;
		} else {
			document.getElementById('l2').innerHTML = "";
		}

	}
	function PinCode(val) {
		var pinCode = frm.pinCode;
		if (pinCode.value == null || pinCode.value == ""
				|| pinCode.value.length != 6) {

			document.getElementById("l3").innerHTML = "<p class='glyphicon glyphicon-warning-sign'>Pincode Must Be Six Digit..!</p>";

		} else {
			document.getElementById("l3").innerHTML = " ";

		}

	}
	function Email(val) {
		var email = frm.email;
		var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

		if (!(frm.email.value.match(reg))) {
			document.getElementById("l4").innerHTML = "<p class='glyphicon glyphicon-warning-sign'>Enter Valid Email Address..!</p>";
			return false;
		} else {
			document.getElementById("l4").innerHTML = " ";

		}
	}
	function Password(val) {
		var password = frm.password;
		if (password.value == "" || password.value == null) {
			document.getElementById("l5").innerHTML = "<p class='glyphicon glyphicon-warning-sign'>Enter Password..!</p>";
			return true;
		} else {
			document.getElementById('l5').innerHTML = "";
		}

	}

	function MobileNumber(val) {
		var mobileNumber = frm.mobileNumber;
		if (mobileNumber.value == null || mobileNumber.value == ""
				|| mobileNumber.value.length != 10) {

			document.getElementById("l6").innerHTML = "<p class='glyphicon glyphicon-warning-sign'>Mobile Number Must Be 10 Digit..!</p>";

		} else {
			document.getElementById("l6").innerHTML = " ";

		}
	}
	
	function Role(val) {
		var role = frm.role;
		if (role.value == "" || role.value == null) {
			document.getElementById("l7").innerHTML = "<p class='glyphicon glyphicon-warning-sign'>Enter Role..!</p>";
			return true;
		} else {
			document.getElementById('l7').innerHTML = "";
		}

	}
</script>
<link rel="shortcut icon" href="img/softweb_logo@2x.png">

</head>

<body>
	<!-- left menu  -->
	<jsp:include page="leftmenu.jsp"></jsp:include>
	<!-- left menu ends -->
	<div id="sampleForm" class="col-lg-10 col-sm-10">

		<!-- content starts -->
		<div>
			<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li><a href="createUser">Add New User</a></li>
			</ul>
		</div>

		<div class="row">
			<div class="box col-md-12">
				<div class="box-inner">
					<div class="box-header well">
						<h2 class="animated rubberBand">
							<i class=" glyphicon glyphicon-plus-sign"></i> Add New User
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
							<%-- <jsp:include page="createAdmin.jsp"></jsp:include> --%>
							<form:form id="contact" action="saveuser" commandName="user"
								method="get" name="frm">
								<form:hidden path="uid" id="uid" />

								<%-- <form:hidden path="adminId" id="adminId"/>
                                <form:hidden id="adminPassword"  path="adminPassword" />
								 --%>
								<label for="selectError"> Enter Name:</label>
								<label style="color: red;" id="l1"></label>
								<div class="input-group input-group-lg">
									<span class="input-group-addon" style="height: 10px;"> <i
										class="glyphicon glyphicon-user"></i>
									</span>
									<form:input id="uname" path="uname" class="form-control"
										placeholder="Enter Name" onblur="Uname(this.value);" />
									<%-- <form:input id="uname" path="uname" class="form-control"
										placeholder="Enter Name"  onblur="varify();" />
										 --%>
								</div>
								<div>

									<form:errors path="uname" color="red" class="error"></form:errors>
								</div>
								<br>
								
								
								<label for="selectError"> Enter Role:</label>
								<label style="color: red;" id="l7"></label>
								<div class="input-group input-group-lg">
									<span class="input-group-addon" style="height: 10px;"> <i
										class="glyphicon glyphicon-user"></i>
									</span>
									<form:input id="role" path="role" class="form-control"
										placeholder="Enter Role" onblur="Role(this.value);" />
								</div>
								<div>

									<form:errors path="role" color="red" class="error"></form:errors>
								</div>
								<br>
								
								
								<label for="selectError">Enter City:</label>
								<label style="color: red;" id="l2" name="l2"></label>
								<div class="input-group input-group-lg">

									<span class="input-group-addon"><i
										class="glyphicon glyphicon-plane"></i> </span>
									<form:input id="city" path="city" class="form-control"
										placeholder="Enter City" onblur="City(this.value);" />
								</div>
								<div>
									<form:errors path="city" class="error"></form:errors>
								</div>
								<br>
								<div class="control-group">

									<label for="selectError">Select Country Name:</label> <label
										style="color: red;" id="l12" name="l12"></label>
									<div class="controls input-group input-group-lg">

										<select onchange="print_state('state',this.selectedIndex);"
											id="country" name="country" data-rel="chosen"
											style="width: 570px; height: 8px;">
										</select>
									</div>
								</div>
								<br>
								<div class="control-group">
									<label for="selectError">Select State Name:</label>
									<div class="controls input-group input-group-lg">
										<select name="state" id="state" style="width: 570px;"></select>
										<script language="javascript">
											print_country("country");
										</script>


									</div>
								</div>
								<br>
								<label for="selectError">Enter Pincode:</label>
								<label style="color: red;" id="l3"></label>
								<div class="input-group input-group-lg">

									<span class="input-group-addon"><i
										class="glyphicon glyphicon-gift"></i> </span>
									<form:input id="pinCode" path="pinCode" class="form-control"
										placeholder="Enter Pincode" onblur="PinCode(this.value);" />
								</div>
								<div>
									<form:errors path="pinCode" color="red" class="error"></form:errors>
								</div>
								<br>

								<label for="selectError">Enter Email:</label>
								<label style="color: red;" id="l4"></label>
								<div class="input-group input-group-lg">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i> </span>
									<form:input id="email" path="email" class="form-control"
										placeholder="Enter Email Address" onblur="Email(this.value);" />
								</div>
								<div>
									<form:errors path="email" class="error"></form:errors>
								</div>
								<br>

								<label for="selectError">Enter Password:</label>
								<label style="color: red;" id="l5"></label>
								<div class="input-group input-group-lg">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock red"></i> </span>
									<form:password id="password" path="password"
										class="form-control" placeholder="Enter Password"
										onblur="Password(this.value);" />
								</div>
								<div>
									<form:errors path="password" class="error"></form:errors>
								</div>
								<br>
								<label for="selectError">Enter Mobile Number:</label>
								<label style="color: red;" id="l6"></label>
								<div class="input-group input-group-lg">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-hand-right"></i> </span>
									<form:input id="mobileNumber" path="mobileNumber"
										class="form-control" placeholder="Enter Mobile Number"
										onblur="MobileNumber(this.value);" />
								</div>
								<div>
									<form:errors path="mobileNumber" class="error"></form:errors>
								</div>
								<br>
								<%-- <tr>
											<td>Select File To Upload</td>
											<td><form:input type="file" id="fileName"
													path="fileName" /></td>
										</tr>

 --%>
								
								<tr>
									
										<td colspan="2" align="center">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button class="btn btn-primary btn-sm glyphicon glyphicon-ok"
												style="width: 100px;" title="" 
												data-toggle="tooltip"
												class="btn btn-warning"
												data-original-title="You Can Save The Data"
												onclick="doAjaxPost();">Save</button>
									

									&nbsp;&nbsp;&nbsp;
									<button
										class="btn btn-primary btn-sm glyphicon glyphicon-repeat"
										style="width: 100px;" type="reset" title=""
										data-toggle="tooltip" class="btn btn-warning"
										data-original-title="You Can Reset The TextBox">Reset</button>

									<!--  <input type="submit" name="submit" value="Delete" class="signin"/>-->
									</td>
								</tr>
								
							</form:form>

						</div>
						<!-- Model -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content"></div>
							</div>
						</div>
						<!-- /Model -->

					</div>
				</div>
			</div>
		</div>
		<footer class="row">

			<p style="margin-left: 17px;">
				Powered by: <a href="#">N-Xpert Solution PVT.LTD</a>
			</p>
		</footer>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>