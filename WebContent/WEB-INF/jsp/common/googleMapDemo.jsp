<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Contact Us</title>
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
<!-- The fav icon -->
<link rel="shortcut icon" href="img/softweb_logo@2x.png" />
<style type="text/css">
div#map_container {
	width: 1050px;
	height:350px;
}
</style>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>	
<script type="text/javascript">
	function loadMap() {
		var latlng = new google.maps.LatLng(23.0118169,72.5232679);
		var myOptions = {
			zoom : 4,
			center : latlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map_container"),
				myOptions);

		var marker = new google.maps.Marker({
			position : latlng,
			map : map,
			title : "B-305, Titanium City Centre, Nr. Indian Petrol Pump, 100 Ft. Road, Satellite,Ahmedabad,Gujarat, India. "
		});
	}
</script>
</head>

<body onload="loadMap()">
	<!-- left menu -->
	<jsp:include page="leftmenu.jsp"></jsp:include>
	<!-- left menu ends -->
	<div id="content" class="col-lg-10 col-sm-10">
		<!-- content starts -->
		<div style="min-width: 1066px">
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li><a href="#">Contact Us</a></li>
			</ul>
		</div>

		<div class="row" style="min-width: 1098px;">
			<div class="box col-md-12">
				<div class="box-inner">
					<div class="box-header well">
						<h2 class="animated rubberBand">
							<i class=" glyphicon glyphicon-tint"></i>Contact Us
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
						<div id="map_container">
						</div>
							
						</div>
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
