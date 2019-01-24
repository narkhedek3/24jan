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

	<link href="css/table.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<!-- banner -->
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<!-- /banner -->
	<div class="banner1">
		<div class="wthree_banner1_info">
			<h3><span>S</span>corecard</h3>
		</div>
	</div>
	<!-- //banner -->
	<!-- Players List -->
	
	

	<br />


<div class="container" style="width:300px; height: 140px;border: 2px solid black;">

		<div class="card ">
			

			<div class="card-header" style="text-align: center">
				<h3> TOURNAMENT NAME </h3>
			</div>
			<br>
			<div class="card-body" style="width:100%" ">
						
						<h4 style="text-align: center">Team1 VS Team2</h4> 
				
			</div>
			<br>
			<div class="card-footer make-center">
			<h4 class="make-center" style="background: #09347a;; color:whitesmoke;width: 100%">
				<span>Team1:</span> &nbsp;
				<span>100</span> &nbsp;
				<span>/</span> &nbsp;
				<span>3</span> &nbsp;


			</div>
			
		</div>
	</div>
	<br>
	

	<div style="margin-left: 250px; margin-right: 250px">
		<table class="table table-sm table-primary" style="border-top: 1px solid gray">
			<thead>
			<h3><b>Batsman</b></h3>
			
				<tr>
				
					<th scope="col">Name</th>
					<th scope="col">Runs</th>
					<th scope="col">Balls</th>
					<th scope="col">No. of 4's</th>
					<th scope="col">No. of 6's</th>
					<th scope="col">StrikeRate</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">Priyanka</th>
					<td>45</td>
					<td>30</td>
					<td>5</td>
					<td>02</td>
					<td>12.5</td>
				</tr>

			</tbody>
		</table>
	</div>

		<br>
		<br>
		
	<div style="margin-left: 250px; margin-right: 250px">
		<table class="table table-sm table-primary" style="border-top: 1px solid gray">
			<thead>
			<h3><b>Bowler</b></h3>
	
				<tr>
				
					<th scope="col">Name</th>
					<th scope="col">Overs</th>
					<th scope="col">Runs</th>
					<th scope="col">Wickets</th>
					<th scope="col">No Balls</th>
					<th scope="col">Wide</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">Priyanka</th>
					<td>10</td>
					<td>45</td>
					<td>3</td>
					<td>03</td>
					<td>03</td>
				</tr>

			</tbody>
		</table>
	</div>


	<!-- Players List -->
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