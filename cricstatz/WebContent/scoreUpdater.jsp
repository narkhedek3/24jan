<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dto.MatchDetails" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Tennis Court a Sports Category Flat Bootstrap Responsive
	Website Template | Mail :: w3layouts</title>
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

	<%
		MatchDetails match = (MatchDetails)request.getAttribute("match");
	%>
	<!-- /banner -->
	<div class="banner1">
		<div class="wthree_banner1_info">
			<h3>
				<span>T</span>eam Profile
			</h3>
		</div>
	</div>
	<!-- //banner -->
	<!-- Team Profile -->

	<h1><%=match.getTeam1Id() %> Vs <%=match.getTeam2Id() %></h1>

	<div class="coaching_section">
		
	<div class="container" style="width:450px; height: 350px;border: 2px solid black;">
	<!--<h1>Score Updator</h1>-->
		<div class="card ">
		<div class="card-header" style="margin-top: 10px; margin-button: 10px">
		
			<div>
					<textarea rows="2" cols="15">6/0</textarea>

					<textarea rows="2" cols="15">0.2</textarea>
			</div>
			
		</div>	
			
			
			<div style="margin-top: 15px">
				<table>
				
				<tr >
				<td><button type="button" style="height:50px; width:100px" class="btn btn-primary waves-effect">+1</button></td>
				<td><button type="button" style="height:50px; width:100px" class="btn btn-primary waves-effect">+2</button></td>
				<td><button type="button" style="height:50px; width:100px" class="btn btn-primary waves-effect">+3</button></td>
				</tr>
				
				
				<tr >
				<td><button type="button" style="height:50px; width:100px" class="btn btn-primary waves-effect">dot ball</button></td>
				<td><button type="button" style="height:50px; width:100px" class="btn btn-primary waves-effect">+4</button></td>
				<td><button type="button" style="height:50px; width:100px" class="btn btn-primary waves-effect">+6</button></td>
				</tr>
				
				<tr >
				<td><button type="button" style="height:50px; width:100px" class="btn btn-primary waves-effect">wide ball</button></td>
				<td><button type="button" style="height:50px; width:100px" class="btn btn-primary waves-effect">no ball</button></td>
				<td><button type="button" style="height:50px; width:100px" class="btn btn-primary waves-effect">wicket</button></td>
				</tr>
				
				</table>
			
				</div>



					<div class="card-footer make-center">
						<div class=" make-center" style="margin-top: 15px">
							<a href="#">
							<button type="button"
									class="btn btn-primary waves-effect"
									style="height: 50px; width: 80px">Undo
							</button>
							</a>
						</div>
					</div>
				</div>
	<br>

	</div>

</div>
	
		
	<!-- Team Profile -->
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- //footer -->

	
	
	<!-- Modal4 -->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<div class="signin-form profile">
						<h3 class="agileinfo_sign">Add Player Info </h3>
						<div class="login-form">
							<form action="#" method="post">
								<input type="text" name="name" placeholder="Player Name"required=""> 
								<input type="text" name="age" placeholder="Player Age" required=""> 
								<input type="text" name="jerseyno" placeholder="Jersey No." required=""> 
													 
									 <input type="submit" value="Add Player">
							</form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Modal4 -->

	<!-- //bootstrap-pop-up -->

	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
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