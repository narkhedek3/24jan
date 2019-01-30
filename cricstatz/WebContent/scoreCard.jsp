<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dto.MatchDetails" %>
<%@ page import="dto.Player" %>
<%@ page import="dto.Team" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="zxx">

<head>

	<title>Score Card</title>
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
<%
	MatchDetails match = (MatchDetails)request.getAttribute("match");
	Team team1 = (Team)request.getAttribute("team1");
	Team team2 = (Team)request.getAttribute("team2");
	List<Player> team1Players = (List<Player>)request.getAttribute("team1Players");
	List<Player> team2Players = (List<Player>)request.getAttribute("team2Players");
	String tournamentName = (String) request.getAttribute("tournamentName");

%>


<div class="container" style="width:300px; height: 180px;border: 2px solid black;">
		
			
		
		<div class="card">			

			<div class="card-header" style="text-align: center">
				<h3><%= tournamentName %>
				</h3>
				<spr:form commandName="matchDetails" class="make-center" action="viewScoreCard.htm" method="post">
						<spr:hidden path="matchId" value="<%=match.getMatchId() %>"/>
						<input type="submit" value="Refresh" class="btn btn-primary" />
			</spr:form>			
			</div>
			<br>
			<div class="card-body" style="width:100% " >
						
				<button type="button" id="team1" style="height: 30px; width: 100%"class="btn btn-primary " onclick=" selectTeam1(<%=team1.getTeamId()%>)"><%=team1.getTeamName()%></button>
				<h3>VS</h3>
				<button type="button" id="team2" style="height: 30px; width: 100%"class="btn btn-primary " onclick="selectTeam2(<%=team2.getTeamId()%>)"><%=team2.getTeamName()%></button>		
				
			</div>			
			<br>
			
			
			
			
		</div>
	</div>
	<br>
	
<div id="currentTeam1">
			<div class="card-footer make-center">
			<h4 class="make-center" style="background: #09347a; color:whitesmoke;width: 100%">
				<span><%=team1.getTeamName()%></span> &nbsp;
				<span><%=team1.getTeamScore()%></span> &nbsp;
				<span>/</span> &nbsp;
				<span><%=team1.getTotalWickets()%></span> &nbsp;
			</h4>

			</div>
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
			<%
				for(Player player : team1Players){
			%>
				<tr>
					<th scope="row"><%=player.getPlayerName() %></th>
					<td><%=player.getPlayerCurrentScore() %></td>
					<td><%=player.getBatsmanCurrentBalls() %></td>
					<td><%=player.getCurrentMatch_4s() %></td>
					<td><%=player.getCurrentMatch_6s() %></td>
					
					<% if(player.getBatsmanCurrentBalls()!=0){ %>	
					<td><%=(player.getPlayerCurrentScore() / player.getBatsmanCurrentBalls())*100 %></td>
					<% }else{ %>
					<td>-</td>
					<%
					}
					%>
				</tr>
			<% } %>
		
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
					<th scope="col">Economy</th>
					
				</tr>
			</thead>
			<tbody>
			<%
			
				for(Player player : team2Players){
					int a = (int)(player.getCurrentBallsByBowler() / 6) ;
			%>
				<tr>
					<th scope="row"><%=player.getPlayerName() %></th>
					<td><%=(int)(player.getCurrentBallsByBowler() / 6) %>. <%=(int)(player.getCurrentBallsByBowler() % 6) %></td>
					<td><%=player.getBowlerCurrentRuns()%></td>
					<td><%=player.getCurrentMatchWickets()%></td>
					<%if(player.getCurrentBallsByBowler()!=0)
					{
					%>	
					
					<td><%= ( (player.getBowlerCurrentRuns()) / (player.getCurrentBallsByBowler() / 6) ) %></td>
					<%
					}else{
					%>
					<td>-</td>
					<% } %>				
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
</div>


<div id="currentTeam2">
			<div class="card-footer make-center">
			<h4 class="make-center" style="background: #09347a; color:whitesmoke;width: 100%">
				<span><%=team2.getTeamName()%></span> &nbsp;
				<span><%=team2.getTeamScore()%></span> &nbsp;
				<span>/</span> &nbsp;
				<span><%=team2.getTotalWickets()%></span> &nbsp;
			</h4>

			</div>
	<div style="margin-left: 250px; margin-right: 250px">
		<table class="table table-sm table-primary" style="border-top: 1px solid gray">
			<thead>
			<h3><b>Batsman</b></h3>
			
				<tr>
				
					<th scope="col">Name123</th>
					<th scope="col">Runs</th>
					<th scope="col">Balls</th>
					<th scope="col">No. of 4's</th>
					<th scope="col">No. of 6's</th>
					<th scope="col">StrikeRate</th>
				</tr>
			</thead>
			<tbody>
				<%
				for(Player player : team2Players){
				%>
				<tr>
					<th scope="row"><%=player.getPlayerName() %></th>
					<td><%=player.getPlayerCurrentScore() %></td>
					<td><%=player.getBatsmanCurrentBalls() %></td>
					<td><%=player.getCurrentMatch_4s() %></td>
					<td><%=player.getCurrentMatch_6s() %></td>
					<% if(player.getBatsmanCurrentBalls()!=0){ %>
					<td><%=(player.getPlayerCurrentScore() / player.getBatsmanCurrentBalls())*100 %></td>
					<% }else{ %>
					<td>-</td>
					<% } %>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
	</div>

		<br>
		<br>
		
	<div style="margin-left: 250px; margin-right: 250px">
		<table class="table table-sm table-primary" style="border-top: 1px solid gray">
			<thead>
			<h3>Bowler</h3>
	
				<tr>
				
					<th scope="col">Name</th>
					<th scope="col">Overs</th>
					<th scope="col">Runs</th>
					<th scope="col">Wickets</th>
					<th scope="col">Economy</th>
					
				</tr>
			</thead>
			<tbody>
				<%
				for(Player player : team1Players){
				%>
				<tr>
					<th scope="row"><%=player.getPlayerName() %></th>
					<td><%=(player.getCurrentBallsByBowler() / 6) %></td>
					<td><%=player.getBowlerCurrentRuns()%></td>
					<td><%=player.getCurrentMatchWickets()%></td>
					<% if(player.getCurrentBallsByBowler()!=0){ %>
					<td><%= ( (player.getBowlerCurrentRuns()) / (player.getCurrentBallsByBowler() / 6) ) %></td>
					<% }else{ %>
					<td>-</td>
					<% }%>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
	</div>
</div>

	<!-- Players List -->
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- //footer -->

	
	<!-- //stats js -->
	<script type="text/javascript">
	$("#currentTeam1").show();
	$("#currentTeam2").hide();
	
	function selectTeam1(id){
				
					$("#currentTeam1").show();
					$("#currentTeam2").hide();

								
									
			}

		function selectTeam2(id){
			
				$("#currentTeam1").hide();
				$("#currentTeam2").show();

				
				
			
		}
		</script>

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