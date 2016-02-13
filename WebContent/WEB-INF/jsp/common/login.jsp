<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>User Login</title>
<jsp:include page="header.jsp"></jsp:include>
<script type='text/javascript' src='jquery.min.js'></script>
</head>
<style>
#contact label {
	display: inline-block;
	width: 100px;
	text-align: right;
}
#contact_submit {
	padding-left: 100px;
}

#contact div {
	margin-top: 1em;
}

textarea {
	vertical-align: top;
	height: 5em;
}

.error {
	display: none;
	margin-left: 10px;
}

.error_show {
	color: red;
	margin-left: 10px;
}

input.invalid, textarea.invalid {
	border: 2px solid red;
}

input.valid, textarea.valid {
	border: 2px solid green;
}
</style>

<!-- JavaScript Code -->
<script>
	$(document)
			.ready(
					function() {

						$('#contact_email')
								.on(
										'input',
										function() {
											var input = $(this);
											var re = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
											var is_email = re.test(input.val());
											if (is_email) {
												input.removeClass("invalid")
														.addClass("valid");
											} else {
												input.removeClass("valid")
														.addClass("invalid");
											}
										});
						$('#contact_password').on('input', function() {
							var input = $(this);
							var is_name = input.val();
							if (is_name) {
								input.removeClass("invalid").addClass("valid");
							} else {
								input.removeClass("valid").addClass("invalid");
							}
						});

						$("#contact_submit button")
								.click(
										function(event) {
											var form_data = $("#contact")
													.serializeArray();
											var error_free = true;
											for ( var input in form_data) {
												var element = $("#contact_"
														+ form_data[input]['name']);
												var valid = element
														.hasClass("valid");
												var error_element = $("span",
														element.parent());
												if (!valid) {
													error_element.removeClass(
															"error").addClass(
															"error_show");
													error_free = false;
												} else {
													error_element.removeClass(
															"error_show")
															.addClass("error");
												}
											}
											if (!error_free) {
												event.preventDefault();
											} else {
												alert('No errors: Form will be submitted');
											}
										});

					});
</script>
<body class="wrp">

	<div class="ch-container">
		<div class="row">

			<div class="row"></div>

			<div class="row">
				<div class="well col-md-5 center login-box"
					style="margin-top: 26px;">
					<div class="alert alert-info">
						<div>
							<img alt="Login" src="img/login.png">
						</div>
						Please login with your Email Address and Password. <br>
					</div>
					<form id="contact" class="form-horizontal" action="doLogin"
						method="get" name="frm">
						<fieldset>
							<div class="input-group input-group-lg">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user red"></i> </span> 
									
									<input type="text"
									id="contact_email" name="email" value="${email}"
									class="form-control" placeholder="Enter Email Address"
									onblur="Email(this.value);" />

							</div>
							<div class="clearfix"></div>
							<br>

							<div class="input-group input-group-lg">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock red"></i> </span> <input
									type="password" id="contact_password" name="password"
									class="form-control" placeholder="password"
									onblur="Password(this.value);" />

							</div>
							<br> <a data-toggle="modal" title="" data-toggle="tooltip"
								data-target="#myModal" href="forgotpassword"> <i
								class="glyphicon glyphicon-edit icon-white"></i> Forgot
								Password?
							</a> <br>
							<p class="center col-md-5" style="width: 195px;">
								<button type="submit" class="btn btn-primary" id="ajax_bt">Login</button>
							</p>


							<br>
							<p>

								<label style="width: initial; color: red">${msg}</label>
								<label style="width: initial; color: red">${msg1}</label>
							</p>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Model -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<!-- /Model -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>

