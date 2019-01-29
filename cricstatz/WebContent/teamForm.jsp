<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form"%>
<%@page import="dto.User"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Team Form</title>
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
				<span>T</span>eam
			</h3>
		</div>
	</div>
	<!-- //banner -->

	<div class="coaching_section">
		<div class="container">
			<div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<h3 class="w3l_header w3_agileits_header">
						Team <span>Form Registration</span>
					</h3>

				</div>
			</div>
			<div class="agile_team_grids_top">
				<div class="signin-form profile">
					<h3 class="agileinfo_sign">Team Form</h3>
					<div class="login-form">
						<spr:form commandName="team" action="postTeamForm.htm"
							method="post">
							<spr:input placeholder="Team Name" pattern="^[a-zA-Z0-9]*[a-zA-Z]+[a-zA-Z0-9]*$" required="" path="teamName" />
							<%User user = (User)session.getAttribute("user"); %>
							<spr:input placeholder="Email Id" required="" readonly="true" path="emailId" value="<%=user.getEmailId()%>" />						
							<input type="text" pattern="^[a-zA-Z0-9]*[a-zA-Z]+[a-zA-Z0-9]*$" placeholder="Location" />
							<div class="tp">
								<input type="submit" value="Create">
							</div>
						</spr:form>
					</div>
				</div>
			</div>
			<!--TEAM FORM -->
		</div>
	</div>

	<!--TEAM FORM -->

	
	
	
	

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