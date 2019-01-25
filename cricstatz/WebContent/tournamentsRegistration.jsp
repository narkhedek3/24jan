<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form"%>
<%@page import="dto.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="banner1">
		<div class="wthree_banner1_info">
			<h3>
				<span>T</span>ournament Information
			</h3>
		</div>
	</div>




	<div class="w3_agile_team_grid_left">
		<h3 class="w3l_header w3_agileits_header">
			Add <span> Upcoming Tournament in your City</span>
		</h3>
		<p class="sub_para_agile">All Feilds are Mandatory</p>
	</div>






	<div style="margin-left: 250px; margin-right: 250px">

		<spr:form action="postTournamentsRegistraion.htm" method="post"
			commandName="tournament" onsubmit="return validate()">
			<div class="form-group">
				<label>Tournament Name</label>
				<spr:input type="text" pattern="^[a-zA-Z0-9]*[a-zA-Z]+[a-zA-Z0-9]*$" id="name" class="form-control" path="tournamentName" />
			</div>
			<%User user = (User)session.getAttribute("user"); %>
		 	<div class="form-group">
				<label>Organizer Email ID</label>
				<spr:input type="email" class="form-control" path="emailId" value="<%=user.getEmailId()%>" readonly="true" />
			</div>

			<div class="form-group">
				<label>Registration Start Date</label>
				<spr:input type="date"   id="sdate"  class="form-control" path="registrationStartDate" placeholder="yyyy-mm-dd"/>
			</div> 
			
			<div class="form-group">
				<label>Registration End Date</label>
				<spr:input type="date" id="edate"  class="form-control" path="registrationEndDate" placeholder="dd/mm/yyyy"/>
			</div>
			
			<div class="form-group">
				<label>Tournament Start Date</label>
				<spr:input type="date"  id="tsdate"  class="form-control" path="tournamentStartDate" placeholder="dd/mm/yyyy"/>
			</div>
			
			<div class="form-group">
				<label>Tournament End Date</label>
				<spr:input type="date" id="tedate" class="form-control" path="tournamentEndDate" placeholder="dd/mm/yyyy"/>
			</div>
			
			 
		<div class="form-group">
				<label>Number Of Teams</label> 
				<spr:select class="form-control"
					path="numberOfTeams">
					<spr:option value="0">Choose...</spr:option>
					<spr:option value="4">4</spr:option>
					<spr:option value="8">8</spr:option>
					<spr:option value="16">16</spr:option>
					<spr:option value="32">32</spr:option>
				</spr:select>
			</div>
			
			<div class="form-group">
				<label>Entry Fee</label>
				<spr:input type="number"  min="1" max="1000" class="form-control" path="entryFee" />
			</div>
			
			<div class="form-group">
				<label>Winning Prize</label>
				<spr:input type="number" min="1" max="10000" class="form-control" path="winningPrize" />
			</div>
			
			<div class="form-group">
				<label>Location</label>
				<spr:input type="text" pattern="^[a-zA-Z0-9]*[a-zA-Z]+[a-zA-Z0-9]*$" class="form-control" path="location" />
			</div>
			
			<div class="form-group">
				<label>Address</label>
				<spr:input type="text" pattern="^[a-zA-Z0-9]*[a-zA-Z]+[a-zA-Z0-9]*$" class="form-control" path="address" />
			</div>
			
			
					 
			<button type="submit" class="btn btn-primary">Submit</button>
		</spr:form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>




	<!-- //bootstrap-pop-up -->
	
	
	<script type="text/javascript">
		function validate() {
		    var name = document.getElementById("name").value;
		    var sdate = document.getElementById("sdate").value.toString().split("-");
		    var edate = document.getElementById("edate").value.toString().split("-");
		    var tsdate = document.getElementById("tsdate").value.toString().split("-");
		    var tedate = document.getElementById("tedate").value.toString().split("-");

		   /* var syear=parseInt(sdate[0]);
		    var smonth=parseInt(sdate[1]);
		    var sday=parseInt(sdate[2]);*/

		    var cdate = new Date();
		    var cyear = cdate.getFullYear();
		    var cmonth = cdate.getMonth();
		    var cday = cdate.getDate();
		    if (name == "") {
		        alert("Empty fields");
		        return false;
		    }
		    if (sdate == "") {
		        alert("Empty fields");
		        return false;
		    }
		    if (edate == "") {
		        alert("Empty fields");
		        return false;
		    }


		/*Registration start and end date validation*/
		    if(sdate[0] > edate[0]){
		        alert("Invalid");
		        return false;
		    }

		    if(sdate[0] == edate[0]){
		        if(sdate[1] > edate[1]){
		            alert("Invalid");
		            return false;
		        }
		        if(sdate[1] == edate[1] ){
		            if(sdate[2]>edate[2]){
		                alert("Invalid");
		                return false;
		            }
		        }
		    }

		/*Registration start date and Current Date Validation

		if(syear < cyear){
		    alert("Invalid");
		    return false;
		}

		if(syear == cyear){
		    if(smonth < cmonth){
		        alert("Invalid");
		        return false;
		    }
		    if(smonth == cmonth ){
		        if(sday < cday){
		            alert("Invalid");
		            return false;
		        }
		    }
		}
		*/






		/*Tournament start date and Registration End Date*/



		if(edate[0] > tsdate[0])
		{
		    alert("Invalid");
		    return false;
		}

		if(edate[0] == tsdate[0]){
		    if(edate[1] > tedate[1]){
		        alert("Invalid");
		        return false;
		    }
		    if(edate[1] == tsdate[1] ){
		        if(edate[2]>tsdate[2]){
		            alert("Invalid");
		            return false;
		        }
		    }
		}



		/*Tournament start and end Validation*/
		    if (tsdate == "") {
		        alert("Empty fields");
		        return false;
		    }
		    if (tedate == "") {
		        alert("Empty fields");
		        return false;
		    }


		    if(tsdate[0] > tedate[0]){
		        alert("Invalid");
		        return false;
		    }

		    if(tsdate[0] == tedate[0]){
		        if(tsdate[1] > tedate[1]){
		            alert("Invalid");
		            return false;
		        }
		        if(tsdate[1] == tedate[1] ){
		            if(tsdate[2]>tedate[2]){
		                alert("Invalid");
		                return false;
		            }
		        }
		    }

		        

		    return true;

		}



		</script>
	

	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- Counter required files -->
	<script type="text/javascript" src="js/dscountdown.min.js"></script>
	<script src="js/demo-1.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$('.demo2').dsCountDown({
				endDate : new Date("December 24, 2020 23:59:00"),
				theme : 'black'
			});
		});
	</script>
	<!-- //Counter required files -->



	<script src="js/mainScript.js"></script>
	<script src="js/rgbSlide.min.js"></script>
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
	<!-- flexisel -->
	<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselDemo1").flexisel({
				visibleItems : 4,
				animationSpeed : 1000,
				autoPlay : true,
				autoPlaySpeed : 3000,
				pauseOnHover : true,
				enableResponsiveBreakpoints : true,
				responsiveBreakpoints : {
					portrait : {
						changePoint : 480,
						visibleItems : 1
					},
					landscape : {
						changePoint : 640,
						visibleItems : 2
					},
					tablet : {
						changePoint : 768,
						visibleItems : 2
					}
				}
			});

		});
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
	<!-- //flexisel -->
	<!-- gallery-pop-up -->
	<script src="js/lsb.min.js"></script>
	<script>
		$(window).load(function() {
			$.fn.lightspeedBox();
		});
	</script>
	<!-- //gallery-pop-up -->
	<!-- flexSlider -->
	<script defer src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				start : function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script>
	<!-- //flexSlider -->

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