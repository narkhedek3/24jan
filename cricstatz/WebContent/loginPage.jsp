<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Login Page</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Tennis Court Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900"
	rel="stylesheet">

<link href="css/table.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<!-- banner -->
	<jsp:include page="header.jsp"></jsp:include>


	<!-- /banner -->
	<div class="banner1">
		<div class="wthree_banner1_info">
			<h3>
				<span>L</span>ogin
			</h3>
		</div>
	</div>
	<!-- //banner -->
	
	
	
	<div class="signin-form profile">
		<h3 class="agileinfo_sign">Sign In</h3>
		<div class="login-form">
			<spr:form commandName="user" action="loginStatus.htm" method="post">
				<spr:input  type="email" placeholder="Email Id" required="true" path="emailId" />
				<spr:input type="password" placeholder="Password" required="true"
					path="password" />
				<spr:select path="userRole" id="inputState" class="form-control" required="true">
					<spr:option value="" disabled="true" hidden="true" selected="selected">Choose</spr:option>
					<spr:option value="Tournament Representative"></spr:option>
					<spr:option value="Team Representative"></spr:option>
				</spr:select>
				<div class="tp">
					<input type="submit" value="Log In">
				</div>
			</spr:form>
		</div>
	</div>



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