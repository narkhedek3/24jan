<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dto.MatchDetails"%>
<%@ page import="dto.Player"%>
<%@ page import="dto.Team"%>
<%@ page import="java.util.List"%>
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
		MatchDetails match = (MatchDetails) request.getAttribute("match");
		Team team1 = (Team) request.getAttribute("team1");
		Team team2 = (Team) request.getAttribute("team2");
		List<Player> playerTeam1List = (List<Player>) request.getAttribute("playerTeam1List");
		List<Player> playerTeam2List = (List<Player>) request.getAttribute("playerTeam2List");
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

	<h1>
		<label id="playingTeam1"><%=match.getTeam1Id()%></label> Vs <label
			id="playingTeam2"><%=match.getTeam2Id()%></label>
	</h1>

	
		
	<button type="button" style="height: 50px; width: 100px"class="btn btn-primary waves-effect" onclick="selectTeam1(<%=team1.getTeamId()%>)"><%=team1.getTeamName()%></button>
	<button type="button" style="height: 50px; width: 100px"class="btn btn-primary waves-effect" onclick="selectTeam2(<%=team2.getTeamId()%>)"><%=team2.getTeamName()%></button>

	<select id="currentTeam1" >
		<%
			for (Player player : playerTeam1List) {
		%>

		<option value="<%=player.getPlayerId()%>" onselect="setPlayerId(<%=player.getPlayerId()%>)"><%=player.getPlayerName()%></option>
		<%
			}
		%>
	</select>

	<select id="currentTeam2">
		<%
			for (Player player : playerTeam2List) {
		%>

		<option value="<%=player.getPlayerId()%>" onselect="setPlayerId(<%=player.getPlayerId()%>)"><%=player.getPlayerName()%></option>
		<%
			}
		%>
	</select>
	<div class="coaching_section">

		<div class="container"
			style="width: 450px; height: 350px; border: 2px solid black;">
			<!--<h1>Score Updater</h1>-->
			<div class="card ">
				<div class="card-header"
					style="margin-top: 10px; margin-button: 10px">

					<div>
						<textarea rows="2" cols="15">6/0</textarea>

						<textarea rows="2" cols="15">0.2</textarea>
					</div>

				</div>


				<div style="margin-top: 15px">
					<table>

						<tr>
							<td><button id="addOne" type="button"
									style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+1</button></td>
							<td><button type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+2</button></td>
							<td><button type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+3</button></td>
						</tr>


						<tr>
							<td><button type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">dot ball</button></td>
							<td><button type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+4</button></td>
							<td><button type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+6</button></td>
						</tr>

						<tr>
							<td><button type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">wide ball</button></td>
							<td><button type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">no ball</button></td>
							<td><button type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">wicket</button></td>
						</tr>

					</table>

				</div>



				<div class="card-footer make-center">
					<div class=" make-center" style="margin-top: 15px">
						<a href="#">
							<button type="button" class="btn btn-primary waves-effect"
								style="height: 50px; width: 80px">Undo</button>
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



	>



	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->

	<!-- ajax -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
    $(document).ready(function(){
       
    	  $('#addOne').click(function(e) {
        	 // let ctr = $(this).val();
        	  /* if(ctr == 10) {
        		  var timeinterval  = 10;
        	      var basePrice     = 1000;
        	      var consumerName  = "abc"; */

					var addOne=1;
        	      
        	      console.log("ok");
          		  $.ajax({
       	    	    url: 'http://localhost:8081/cricstatz/addOne.htm?teamId='+currentTeamId+'&playerId='+playerId+'&score='+addOne ,
       	    	    type: 'get',
       	    	
       	    	   /*  success: function(response){
       	    	     // Perform operation on the return value
       	    	     console.log("ok");
       	    	    } */
       	    	   });
          		 console.log("ok2");
           	  
         });
    	  console.log("ok3");
   	});
    </script>

	<!-- //ajax -->

	<!-- select team player -->
	<script type="text/javascript">
		let  team1Id = document.getElementById("playingTeam1").innerHTML;
		let selectedTeam = $('#selectCurrentTeam').val();
		$("#currentTeam1").hide();
		$("#currentTeam2").hide();
		let currentTeamId = null;
		function selectTeam1(id){
				if(id==team1Id){
					$("#currentTeam1").show();
					$("#currentTeam2").hide();
					currentTeamId = id;
					}
				
			}

		function selectTeam2(id){
			if(id!=team1Id){
				$("#currentTeam1").hide();
				$("#currentTeam2").show();
				currentTeamId = id;
				}
			
		}

		function setPlayerId(id)
		{
			let playerId = id;
		}
		
		</script>

	<!-- //select team player -->

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