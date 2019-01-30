<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form" %>
<%@ page import="dto.Team" %>
<%@ page import="dto.Player" %>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="zxx">


<head>
<title>Team Profile</title>
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
		Team team = (Team)request.getAttribute("team");
		
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

	<div class="coaching_section">
		<div class="container">
			<div class="w3_agile_team_grid"></div>
			<div class="agile_team_grids_top">
				<div class="col-md-6 w3ls_banner_bottom_left w3ls_courses_left">
					<div class="w3ls_banner_bottom_right1">
						<h2><%=team.getTeamName() %></h2>

						<ul class="some_agile_facts">
							<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>TEAM
								ID : <%= team.getTeamId() %>
							</li>
							
							<%
								if(team.getTournamentId()!=0){
							%>
							
							<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
							Tournament ID : <%= team.getTournamentId() %> 
							</li>
							<% } %>
							<li><i class="fa fa-long-arrow" aria-hidden="true"></i>
								<button class="btn btn-primary" data-toggle="modal" data-target="#myModalEdit">EDIT PROFILE</button></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 agileits_courses_right">
					<img src="images/2.jpg" alt=" " class="img-responsive" />
				</div>
				<div class="clearfix"></div>

			</div>
			<div>
				<%
					List<Player> playerList = (List<Player>)session.getAttribute("playerList");
				
				%>
				<table class="table table-sm table-primary">
					<thead>
						<tr>
							<th scope="col">Player ID</th>
							<th scope="col">Name</th>
							<th scope="col">No. of 6's</th>
							<th scope="col">No. of 4's</th>
							<th scope="col">Runs</th>
						</tr>
					</thead>
					<tbody  id="playerTable">
						
						<%
							for(Player player : playerList)
							{
								
						
						%>
						<tr>
							<th scope="row"><%= player.getPlayerId() %></th>
							<td><%= player.getPlayerName() %></td>
							<td><%=player.getTotal_6s()%></td>
							<td><%=player.getTotal_4s()%></td>
							<td><%=player.getPlayerTotalRuns()%></td>
							<td><a href="delete_player.htm?playerId=<%=player.getPlayerId()%>" >Delete</a></td>
						    <td><a href="select_player.htm?playerId=<%=player.getPlayerId()%>" >Update</a></td>
						</tr>
						<%
							}
						
						%>
					</tbody>
				</table>
			</div>
			
			<div>
				<a class="btn btn-primary"  href="playerForm.htm" onclick="return fullTeam(this)">Add Player</a>
			</div>
			
		</div>
	</div>


	<!-- Team Profile -->
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- //footer -->
	
	
	 <!-- teamEditModal -->
	<div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<div class="signin-form profile">
						<h3 class="agileinfo_sign">Team Update</h3>
						<div class="login-form">
							<spr:form action="teamEditModal.htm" method="post" commandName="team">
								TEAM emailID:<spr:input type="text"  path="emailId" readonly="true"/>
								TEAM ID:<spr:input type="text"  path="teamId" readonly="true"/>
								TOURNAMENT ID:<spr:input type="text"  path="tournamentId" readonly="true"/>   
								TEAM NAME:<spr:input type="text"  path="teamName" required=""/>
								
								<input type="submit" value=" Change">
							</spr:form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //teamEditModal --> --

	
	<script type="text/javascript">
		function fullTeam(buttonRef){
				var teamTable = document.getElementById("playerTable")
				if(teamTable.childElementCount>10){
					buttonRef.disabled=true;
					alert("Not more than 11 players");
					return false;
					
					}
				return true;
			}
		
	</script>




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