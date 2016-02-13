<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Loading</title>
<jsp:include page="header.jsp"></jsp:include>
<script type='text/javascript' src='jquery.min.js'></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#ajax_bt').click(function() {
			// $(".ch-container").hide();
			$('#ajax_div').html('<img src="img/progressbar.gif">');
			setTimeout(function() {
				$(".ch-container").fadeOut();
				$('#ajax_div').load("login");
			}, 2000);
		});
	});
</script>
</head>
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
						<p class="center col-md-5" style="width: 195px;">
							<button type="submit" class="btn btn-primary" id="ajax_bt">Press
								Button For Login</button>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="ajax_div" style="padding: 10px;"></div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>

