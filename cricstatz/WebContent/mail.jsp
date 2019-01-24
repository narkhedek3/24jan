<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Tennis Court a Sports Category Flat Bootstrap Responsive Website Template | Mail :: w3layouts</title>
	<!-- custom-theme -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Tennis Court Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //custom-theme -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- font-awesome-icons -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<!-- banner -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- /banner -->
	<div class="banner1">
		<div class="wthree_banner1_info">
			<h3><span>M</span>ail Us</h3>
		</div>
	</div>
	<!-- //banner -->
	<!-- mail -->
	<div class="team">
		<div class="container">
			<h3 class="w3l_header w3_agileits_header">Mail <span>Us</span></h3>
			<p class="sub_para_agile">Add Some Short Description</p>
			<div class="agile_team_grids_top">
				<div class="col-md-6 agileinfo_mail_grid_left">
					<form action="#" method="post">
						<span class="input input--nariko">
							<input class="input__field input__field--nariko" name="Name" type="text" id="input-20" placeholder=" " required="" />
							<label class="input__label input__label--nariko" for="input-20">
								<span class="input__label-content input__label-content--nariko">Your Name</span>
							</label>
						</span>
						<span class="input input--nariko">
							<input class="input__field input__field--nariko" name="Email" type="email" id="input-21" placeholder=" "
							 required="" />
							<label class="input__label input__label--nariko" for="input-21">
								<span class="input__label-content input__label-content--nariko">Your Email</span>
							</label>
						</span>
						<span class="input input--nariko">
							<input class="input__field input__field--nariko" name="Subject" type="text" id="input-22" placeholder=" "
							 required="" />
							<label class="input__label input__label--nariko" for="input-22">
								<span class="input__label-content input__label-content--nariko">Your Subject</span>
							</label>
						</span>
						<textarea name="Message" placeholder="Your Message..." required=""></textarea>
						<input type="submit" value="Send">
					</form>
				</div>
				<div class="col-md-6 agileinfo_mail_grid_right">
					<div class="agileinfo_mail_social_right">
						<div class="agileinfo_mail_social_rightl">
							<a href="#" class="w3_contact_facebook">
								<i class="fa fa-facebook" aria-hidden="true"></i>
								<p>Facebook</p>
							</a>
						</div>
						<div class="agileinfo_mail_social_rightr">
							<a href="#" class="w3_contact_twitter">
								<i class="fa fa-twitter" aria-hidden="true"></i>
								<p>Twitter</p>
							</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="agileinfo_mail_social_right">
						<div class="agileinfo_mail_social_rightl">
							<a href="#" class="w3_contact_google">
								<i class="fa fa-google-plus" aria-hidden="true"></i>
								<p>Google+</p>
							</a>
						</div>
						<div class="agileinfo_mail_social_rightr">
							<a href="#" class="w3_contact_instagram">
								<i class="fa fa-instagram" aria-hidden="true"></i>
								<p>Instagram</p>
							</a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="agileinfo_mail_social_right">
						<div class="agileinfo_mail_social_right_social">
							<a href="#" class="w3_contact_rss">
								<i class="fa fa-rss"></i>
								<p>RSS</p>
							</a>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<div class="agile_map">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3950.3905851087434!2d-34.90500565012194!3d-8.061582082752993!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x7ab18d90992e4ab%3A0x8e83c4afabe39a3a!2sSport+Club+Do+Recife!5e0!3m2!1sen!2sin!4v1478684415917"
		 style="border:0"></iframe>
	</div>
	<!-- //mail -->
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- //footer -->

	

	<!-- //bootstrap-pop-up -->

	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- start-smooth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();
				$('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
			});
		});
	</script>
	<!-- start-smooth-scrolling -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function () {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/

			$().UItoTop({ easingType: 'easeOutQuart' });

		});
	</script>
	<!-- //here ends scrolling icon -->
</body>

</html>