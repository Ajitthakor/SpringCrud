<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Gallery</title>
<link rel='stylesheet' id='photobox-css' href='css/photobox.css'
	type='text/css' media='all' />
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type='text/javascript' src='js/jquery.photobox.js'></script>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}
#wrapper {
	width: 90%;
	margin: 0 auto;
}
.gallerycontainer {
	width: 100%;
}

.gallery_wrapper {
	width: 33.3%;
	float: left;
}

.small-img {
	width: 98%;
}
</style>
</head>

<body>
	<div id="wrapper" align="center">
		<div class="gallerycontainer">

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/1.gif"> <img
					src="img/small/1.gif" class="small-img" alt="girl with flowers" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/2.gif"> <img
					src="img/small/2.gif" class="small-img" alt="Beautiful girl" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/3.gif"> <img
					src="img/small/3.gif" class="small-img" alt="So cute" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/4.gif"> <img
					src="img/small/4.gif" class="small-img" alt="Cute baby" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/5.gif"> <img
					src="img/small/5.gif" class="small-img" alt="Colorful kid" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/6.gif"> <img
					src="img/small/6.gif" class="small-img" alt="Angel" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/7.gif"> <img
					src="img/small/7.gif" class="small-img" alt="Cutenesss overloaded" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/8.gif"> <img
					src="img/small/8.gif" class="small-img" alt="Looking at you" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/9.gif"> <img
					src="img/small/9.gif" class="small-img" alt="Impressed" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/10.gif"> <img
					src="img/small/10.gif" class="small-img" alt="Waiting for you" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/11.gif"> <img
					src="img/small/11.gif" class="small-img" alt="Still for you" />
				</a>
			</div>

			<div class="gallery_wrapper">
				<a class="photobox_a" href="img/large/12.gif"> <img
					src="img/small/12.gif" class="small-img" alt="With Angry" />
				</a>
			</div>

		</div>

	</div>

	<script type='text/javascript'>
		jQuery('.gallerycontainer').photobox('.photobox_a');
		jQuery('.gallerycontainer').photobox('.photobox_a:first', {
			thumbs : false,
			time : 0
		}, imageLoaded);
		function imageLoaded() {
			console.log('image has been loaded...');
		}
	</script>
</body>
</html>