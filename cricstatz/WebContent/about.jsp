<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<title>CrickStatz a Sports Category Flat Bootstrap Responsive
	Website Template | About:: w3layouts</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Tennis Court Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" property="" />
<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- /banner -->
	<div class="banner1">
		<div class="wthree_banner1_info">
			<h3>
				<span>A</span>bout
			</h3>
		</div>
	</div>
	<!-- //banner -->
	<!-- courses -->
	<div class="banner-bottom">
		<div class="container">
			<div class="col-md-6 w3ls_banner_bottom_left">
				<div class="w3ls_banner_bottom_right1">
					<p style="margin-bottom:30px; font-size: 20px;">
					CricStatz is an online cricket scoring platform. You can create your tournaments and start managing with this tool. Score every match live and share it with your friends in real time.

organisers can set up their tournaments. CricStatz is all about creating a tournament, teams, players, fixtures and online score updation.
					</p>
					
					<p style="margin-bottom:30px;font-size: 20px;">
					Cricket is a bat-and-ball game played between two teams of
						eleven players on a field at the centre of which is a 20-metre
						(22-yard) pitch with a wicket at each end, each comprising two
						bails balanced on three stumps. The batting side scores runs by
						striking the ball bowled at the wicket with the bat, while the
						bowling and fielding side tries to prevent this and dismiss each
						player (so they are "out").</p>
						
						
					<p style="margin-bottom:30px;font-size:20px;">
					There are various formats ranging from Twenty20, played over
						a few hours with each team batting for a single innings of 20
						overs, to Test matches, played over five days with unlimited overs
						and the teams each batting for two innings of unlimited length.
						Traditionally cricketers play in all-white kit, but in limited
						overs cricket they wear club or team colours.</p>
					
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-6 w3ls_banner_bottom_right">
				<div class="agileits_w3layouts_banner_bottom_grid">
					<img src="images/3.jpg" alt=" " class="img-responsive"
						style="height: 100%; width: 100%; object-fit: contain" />
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //courses -->
	<!-- stats -->
	<div class="stats">
		<div class="col-md-4 w3layouts_stats_left w3_counter_grid">
			<p class="counter">123</p>
			<h3>Tournament</h3>
		</div>
		<div class="col-md-4 w3layouts_stats_left w3_counter_grid1">
			<p class="counter">456</p>
			<h3>Players</h3>
		</div>
		<div class="col-md-4 w3layouts_stats_left w3_counter_grid2">
			<p class="counter">563</p>
			<h3>Team</h3>
		</div>

		<div class="clearfix"></div>
	</div>
	<!-- //stats -->


	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- //footer -->



	<!-- //bootstrap-pop-up -->
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<script src="js/bars.js"></script>
	<!-- stats -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //stats -->
	<!-- carousal -->
	<script src="js/slick.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {
			$(".center").slick({
				dots : true,
				infinite : true,
				centerMode : true,
				slidesToShow : 2,
				slidesToScroll : 2,
				responsive : [ {
					breakpoint : 768,
					settings : {
						arrows : true,
						centerMode : false,
						slidesToShow : 2
					}
				}, {
					breakpoint : 480,
					settings : {
						arrows : true,
						centerMode : false,
						centerPadding : '40px',
						slidesToShow : 1
					}
				} ]
			});
		});
	</script>
	<!-- //carousal -->
	<!-- start-smooth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- start-smooth-scrolling -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->
</body>

</html>