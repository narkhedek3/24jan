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
		Team team1 = (Team)request.getAttribute("team1");
		Team team2 = (Team)request.getAttribute("team2");
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

	
		
	<button type="button" id="team1" style="height: 50px; width: 100px"class="btn btn-primary waves-effect" onclick=" selectTeam1(<%=team1.getTeamId()%>)"><%=team1.getTeamName()%></button>
	<button type="button" id="team2" style="height: 50px; width: 100px"class="btn btn-primary waves-effect" onclick="selectTeam2(<%=team2.getTeamId()%>)"><%=team2.getTeamName()%></button>


	<br>
	<table>
		<tr>
			<td>
				<label >BATTING TEAM</label>
			</td>
			
			<td>
				<label >BOWLING TEAM</label>
			</td>
		</tr>
		
		<tr>
			<td><select id="currentTeam1" onchange="setPlayerId(this)">
					<option value="0">NONE</option>
					<%
						for (Player player : playerTeam1List) {
					%>

					<option value="<%=player.getPlayerId()%>"><%=player.getPlayerName()%></option>
					<%
						}
					%>
			</select> <select id="currentTeam2" onchange="setPlayerId(this)">
					<option value="0">NONE</option>
					<%
						for (Player player : playerTeam2List) {
					%>

					<option value="<%=player.getPlayerId()%>"><%=player.getPlayerName()%></option>
					<%
						}
					%>
			</select></td>
			
			<td><select id="currentBTeam1" onchange="setBPlayerId(this)">
					<option value="0">NONE</option>
					<%
						for (Player player : playerTeam1List) {
					%>

					<option value="<%=player.getPlayerId()%>"><%=player.getPlayerName()%></option>
					<%
						}
					%>
			</select> <select id="currentBTeam2" onchange="setBPlayerId(this)">
					<option value="0">NONE</option>
					<%
						for (Player player : playerTeam2List) {
					%>

					<option value="<%=player.getPlayerId()%>"><%=player.getPlayerName()%></option>
					<%
						}
					%>
			</select></td>
		</tr>
	</table>
	
	
	
	
	
	
	<div class="coaching_section">

		<div class="container"
			style="width: 450px; height: 350px; border: 2px solid black;">
			<!--<h1>Score Updater</h1>-->
			<div class="card ">
				<div class="card-header"
					style="margin-top: 10px; margin-button: 10px">
					
							<%=team1.getTeamName()%>&nbsp;<label id="team1Score"> </label>&nbsp;<span> &nbsp;/ &nbsp;</span> <label id="team1Wicket"></label>
							
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%=team2.getTeamName()%>&nbsp;	<label id="team2Score"></label>&nbsp;<span> &nbsp;/ &nbsp;</span> <label id="team2Wicket"></label>
						
					</div>
					

				</div>


				<div style="margin-top: 15px">
					<table>

						<tr>
							<td><button id="addOne" type="button"
									style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+1</button></td>
									
							<td><button id="addTwo"type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+2</button></td>
									
							<td><button id="addThree" type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+3</button></td>
						</tr>


						<tr>
							
							<td><button id="addFour" type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+4</button></td>
									
							<td><button id="addFive" type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+5</button></td>
									
							<td><button id="addSix" type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">+6</button></td>
									
							
						</tr>

						<tr>
							<td><button id="addZero" type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">dot ball</button></td>
																		
							<td><button id="Wide" type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">wide ball</button></td>
									
							<td><button id="NoBall" type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">no ball</button></td>
									
							
						</tr>
							
						<tr>
									
								<td><button  id="Wicket" type="button" style="height: 50px; width: 100px"
									class="btn btn-primary waves-effect">wicket</button></td>
						</tr>

					</table>

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

				var addOne=1;
				if(currentTeamId==team1Id)
					{
						team1Balls +=1;
						team1Score +=1;
					}
				else
					{
						team2Balls +=1;
						team2Score +=1;
					} 
				document.getElementById("team1Score").innerHTML = team1Score;
				document.getElementById("team2Score").innerHTML = team2Score;
        	      console.log("addOne");
          		  $.ajax({
       	    	    url: 'http://localhost:8081/cricstatz/addOne.htm?teamId='+currentTeamId+'&playerId='+playerId+'&playerBId='+playerBId+'&score='+addOne ,
       	    	    type: 'get',   	    	
       	    	   
       	    	   });    	 
           	  
         });

    	  $('#addTwo').click(function(e) {

				var addTwo=2;
				if(currentTeamId==team1Id)
				{
					team1Balls +=1;
					team1Score +=2;
				}
				else
				{
					team2Balls +=1;
					team2Score +=2;
				}
				document.getElementById("team1Score").innerHTML = team1Score;
				document.getElementById("team2Score").innerHTML = team2Score;
      	      console.log("addTwo");
        		  $.ajax({
     	    	    url: 'http://localhost:8081/cricstatz/addTwo.htm?teamId='+currentTeamId+'&playerId='+playerId+'&playerBId='+playerBId+'&score='+addTwo ,
     	    	    type: 'get',   	    	
     	    	   
     	    	   });    	 
         	  
       });

    	  $('#addThree').click(function(e) {

				var addThree=3;
				if(currentTeamId==team1Id)
				{
					team1Balls +=1;
					team1Score +=3;
				}
				else
				{
					team2Balls +=1;
					team2Score +=3;
				}
				document.getElementById("team1Score").innerHTML = team1Score;
				document.getElementById("team2Score").innerHTML = team2Score;
    	      console.log("addThree");
      		  $.ajax({
   	    	    url: 'http://localhost:8081/cricstatz/addThree.htm?teamId='+currentTeamId+'&playerId='+playerId+'&playerBId='+playerBId+'&score='+addThree ,
   	    	    type: 'get',   	    	
   	    	   
   	    	   });    	 
       	  
     });

    	  $('#addFour').click(function(e) {

				var addFour=4;
				if(currentTeamId==team1Id)
				{
					team1Balls +=1;
					team1Score +=4;
				}
				else
				{
					team2Balls +=1;
					team2Score +=4;
				}
				document.getElementById("team1Score").innerHTML = team1Score;
				document.getElementById("team2Score").innerHTML = team2Score;
  	      console.log("addFour");
    		  $.ajax({
 	    	    url: 'http://localhost:8081/cricstatz/addFour.htm?teamId='+currentTeamId+'&playerId='+playerId+'&playerBId='+playerBId+'&score='+addFour ,
 	    	    type: 'get',   	    	
 	    	   
 	    	   });    	 
     	  
   });

    	  $('#addFive').click(function(e) {

				var addFive=5;
				if(currentTeamId==team1Id)
				{
					team1Balls +=1;
					team1Score +=5;
				}
				else
				{
					team2Balls +=1;
					team2Score +=5;
				}
				document.getElementById("team1Score").innerHTML = team1Score;
				document.getElementById("team2Score").innerHTML = team2Score;
	      console.log("addFive");
  		  $.ajax({
	    	    url: 'http://localhost:8081/cricstatz/addFive.htm?teamId='+currentTeamId+'&playerId='+playerId+'&playerBId='+playerBId+'&score='+addFive ,
	    	    type: 'get',   	    	
	    	   
	    	   });    	 
   	  
 });

    	  $('#addSix').click(function(e) {

				var addSix=6;
				if(currentTeamId==team1Id)
				{
					team1Balls +=1;
					team1Score +=6;
				}
				else
				{
					team2Balls +=1;
					team2Score +=6;
				}
				document.getElementById("team1Score").innerHTML = team1Score;
				document.getElementById("team2Score").innerHTML = team2Score;
	      console.log("addSix");
		  $.ajax({
	    	    url: 'http://localhost:8081/cricstatz/addSix.htm?teamId='+currentTeamId+'&playerId='+playerId+'&playerBId='+playerBId+'&score='+addSix ,
	    	    type: 'get',   	    	
	    	   
	    	   });    	 
 	  
});

      	  $('#addZero').click(function(e) {

				var addZero=0;
				if(currentTeamId==team1Id)
				{
					team1Balls +=1;
				}
				else
				{
					team2Balls +=1;
				}
				document.getElementById("team1Score").innerHTML = team1Score;
				document.getElementById("team2Score").innerHTML = team2Score;
	      console.log("addZero");
		  $.ajax({
	    	    url: 'http://localhost:8081/cricstatz/addZero.htm?teamId='+currentTeamId+'&playerId='+playerId+'&playerBId='+playerBId+'&score='+addZero ,
	    	    type: 'get',   	    	
	    	   
	    	   });    	 
	  
});

      	  $('#Wide').click(function(e) {

				var Wide=1;
				var DeleteBall=-1;

				if(currentTeamId==team1Id)
				{
					team1Balls -=1;
					team1Score +=1;
				}
				else
				{
					team2Balls -=1;
					team2Score +=1;
				}
				document.getElementById("team1Score").innerHTML = team1Score;
				document.getElementById("team2Score").innerHTML = team2Score; 
	      console.log("Wide");
		  $.ajax({
	    	    url: 'http://localhost:8081/cricstatz/Wide.htm?teamId='+currentTeamId+'&playerId='+playerId+'&playerBId='+playerBId+'&score='+Wide ,
	    	    type: 'get',   	    	
	    	   
	    	   });    	 
	  
});

      	  $('#NoBall').click(function(e) {

				var NoBall=1;
				var DeleteBall=-1;

				if(currentTeamId==team1Id)
				{
					team1Balls -=1;
					team1Score +=1;
				}
				else
				{
					team2Balls -=1;
					team2Score +=1;
				}
				document.getElementById("team1Score").innerHTML = team1Score;
				document.getElementById("team2Score").innerHTML = team2Score;
	      
	      console.log("NoBall");
		  $.ajax({
	    	    url: 'http://localhost:8081/cricstatz/NoBall.htm?teamId='+currentTeamId+'&playerId='+playerId+'&playerBId='+playerBId+'&score='+NoBall ,
	    	    type: 'get',   	    	
	    	   
	    	   });    

 });
		 

      	  $('#Wicket').click(function(e) {
					console.log("Wicket");
				var addZero=0;
				if(currentTeamId==team1Id)
				{
					team1Balls +=1;
					team1Wicket +=1;
				}
				else
				{
					team2Balls +=1;
					team2Wicket +=1;
				}

				document.getElementById("team1Wicket").innerHTML = team1Wicket;
				document.getElementById("team2Wicket").innerHTML = team2Wicket;
	      console.log("Wicket");
		  $.ajax({
	    	    url: 'http://localhost:8081/cricstatz/wicket.htm?teamId='+currentTeamId+'&playerId='+playerId+'&playerBId='+playerBId+'&score='+1 ,
	    	    type: 'get',   	    	
	    	   
	    	   });    	 
	  
}); 
   	  
     	
   	});
    </script>

	<!-- //ajax -->

	<!-- select team player -->
	<script type="text/javascript">
		let  team1Id = document.getElementById("playingTeam1").innerHTML;
		let  team2Id = document.getElementById("playingTeam2").innerHTML;
		let selectedTeam = $('#selectCurrentTeam').val();
		$("#currentTeam1").hide();
		$("#currentTeam2").hide();
		$("#currentBTeam1").hide();
		$("#currentBTeam2").hide();
		
		let currentTeamId = null;
		let playerId=null;
		let playerBId=null;
		let team1Balls=0;
		let team2Balls=0;
		let team1Score =0;
		let team2Score =0;
		let team1Wicket=0;
		let team2Wicket=0;
		
		document.getElementById("team1Score").innerHTML = team1Score;
		document.getElementById("team2Score").innerHTML = team2Score;

		document.getElementById("team1Wicket").innerHTML = team1Wicket;
		document.getElementById("team2Wicket").innerHTML = team2Wicket;

		function selectTeam1(id){
				if(id==team1Id){
					$("#currentTeam1").show();
					$("#currentTeam2").hide();

					$("#currentBTeam1").hide();
					$("#currentBTeam2").show();
					
					currentTeamId = id;
					
					}
				
			}

		function selectTeam2(id){
			if(id!=team1Id){
				$("#currentTeam1").hide();
				$("#currentTeam2").show();

				$("#currentBTeam1").show();
				$("#currentBTeam2").hide();
				
				currentTeamId = id;
				}
			
		}

		function setPlayerId(id)
		{
			
			playerId = id.value;
			console.log(playerId);
		}

		function setBPlayerId(id)
		{
			
			playerBId = id.value;
			console.log(playerId);
		}
		</script>

	<!-- //select team player -->


	<!-- <script type="text/javascript">

	function err(){
	alert("are you sure");
	window.history.go();
		

		}
	window.beforeunload=err();
	</script> -->





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