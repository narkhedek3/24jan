<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dto.Team" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Match Result</title>
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
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
	<!-- font-awesome-icons -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>

	<%
		Team team = (Team)request.getAttribute("team");
	%>
	<jsp:include page="header.jsp"></jsp:include>
		<!-- /banner -->
	<div class="banner1">
		<div class="wthree_banner1_info">
			<h3><span>M</span>atch Results</h3>
		</div>
	</div>
	<!-- //banner -->
	<!-- courses -->
	<div class="coaching_section">
		<div class="container">
			<div class="w3_agile_team_grid">
				
			</div>
			<div class="agile_team_grids_top">
				<div class="col-md-6 w3ls_banner_bottom_left w3ls_courses_left">
					<div class="w3ls_courses_left_grids">
						
						<div class="w3ls_courses_left_grid">
							<h3 style="font-size: 80px; text-align:center;"><i aria-hidden="true"></i>WINNER</h3>
							<br>
							<br>
							<h1 style="font-size: 150px; text-align:center;"><%=team.getTeamName() %></h1>
						</div>
						
					</div>
				</div>
				<div class="col-md-6 agileits_courses_right">
					<img src="images/winner.jpg" alt=" " class="img-responsive" />
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	
	
			
		</div>
	</div>
	<!-- //stats-bottom -->
	<!-- stats-bottom-banner -->
	<!-- <div class="stats-bottom-banner">
		<div class="container">
		
		</div>
	</div>
	 -->
	
	
	
	<!-- //testimonials -->
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- //footer -->

	


	
	
</body>

</html>