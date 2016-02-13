<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.signin {
	width: 70px;
	text-align: center;
	font-size: 15px;
	font-family: times new roman font-weight : 200;
	color: #fff;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	box-shadow: 3px 3px 5px #402f55;
	-moz-box-shadow: 3px 3px 5px #402f55;
	-webkit-box-shadow: 3px 3px 5px #402f55;
	color: #573f85;
	z-index: 100;
	height: 25px;
}

.signin:hover {
	background-color: blue;
	color: #E4E4E4;
	cursor: pointer;
}
</style>
<script type='text/javascript' src='jquery.min.js'></script>
<script type='text/javascript' src='js/countries.js'></script>
</head>
<body background="img/background.jpg">
	<form:form name="frm" action="saveuser" commandName="user" method="get"
		enctype="multipart/form-data">

		<form:hidden path="uid" id="uid" />
		<table border="15" align="center">
			<caption>
				<h1>Update User...!</h1>
			</caption>
			<tr>
				<td>Enter Name</td>
				<td><form:input id="uname" path="uname"  /></td>
			</tr>
			<tr>
				<td>Enter Role</td>
				<td><form:input id="role" path="role"  /></td>
			</tr>
			<tr>
				<td>Enter City</td>
				<td><form:input id="city" path="city" /></td>
			</tr>
			<tr>
				<td>Select Country</td>
				<td><select onchange="print_state('state',this.selectedIndex);" id="country" name ="country" style="width:182px;"></select></td>
			</tr>
			<tr>
				<td>Select State</td>
				<td><select name ="state" id ="state" style="width:182px;"></select>
		<script language="javascript">print_country("country");</script></td>
			</tr>
			<tr>
				<td>Enter PinCode</td>
				<td><form:input id="pinCode" path="pinCode" /></td>
			</tr>
			<tr>
				<td>Enter EmailID</td>
				<td><form:input id="email" path="email" /></td>
			</tr>
			<tr>
				<td>Enter Password</td>
				<td><form:password id="password" path="password" /></td>
			</tr>
			<tr>
				<td>Enter Mobile Number</td>
				<td><form:input id="mobileNumber" path="mobileNumber" /></td>
			</tr>
			<!-- <tr>
				<td>Select File To Upload</td>
				<td><input type="file" id="fileName" name="fileName" /></td>
			</tr>
			 --><tr>
				<td colspan="2"><input type="submit" name="submit"
					value="update" class="signin"></td>
			</tr>

		</table>
	</form:form>
</body>
</html>