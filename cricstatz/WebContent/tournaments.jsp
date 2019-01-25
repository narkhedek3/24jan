<%@page import="dto.Tournament"%>
<%@page import="java.util.List"%>
<%@page import="dto.Team"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spr" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Tennis Court a Sports Category Flat Bootstrap Responsive
	Website Template | Home :: w3layouts</title>
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
<link rel="stylesheet" href="css/mainStyles.css" />
<link rel='stylesheet' href='css/dscountdown.css' type='text/css'
	media='all' />
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" property="" />
<!-- gallery -->
<link href="css/lsb.css" rel="stylesheet" type="text/css">
<!-- //gallery -->
<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>
<link
	href="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.min.css"
	rel="stylesheet" />


</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- //banner -->

	<!--card-->

	<%  List<Tournament> list = (List<Tournament>)request.getAttribute("tournamentList");
		Team team = (Team)request.getAttribute("teams");
		System.out.println(team+"+++++++++++++++++++++++++");
		
		String userRole = (String)request.getAttribute("userRole");
		System.out.println(userRole+"***+++++++++++++++++++++++++");
		if(list!=null)
		{
			for(Tournament tournament: list)
			{
	%>

	<div class="container"
		style="width: 300px; height: 260px; border: 2px solid black;">

		<div class="card ">
			<div class="make-center ">

				<img src="images/live.jpg" alt="Card image"
					style="width: 90px; height: 90px; padding-top: 10px;">
			</div>

			<div class="card-header" style="text-align: center">
				<h6>
					<%=tournament.getTournamentId()%>
				</h6>
				<h3>
					<b> <%=tournament.getTournamentName() %>
					</b>
				</h3>
			</div>
			<div class="card-body" style="width: 100%">
				<h4 class="make-center"
					style="background: #09347a;; color: whitesmoke; width: 100%; font-size: 15px">


					<ul style="list-style-type: none; text-align: center">
						<li><%=tournament.getAddress()+ " , " + tournament.getLocation()%></li>
						<li>
							<h4>
								<%=tournament.getWinningPrize() %>
							</h4>
						</li>
						<li><%= tournament.getEntryFee() %></li>
						<li><%= tournament.getRegistrationEndDate() %></li>

					</ul>
				</h4>
			</div>
			<div class="card-footer make-center">
				<h6>
					<%=tournament.getNumberOfTeams()%>
					<%=team.getTournamentId() %>
				</h6>


			</div>
			<% if(request.getAttribute("currentUser")!=null && team.getTournamentId() != tournament.getTournamentId() && userRole.equals("Team Representative")){ %>
			<div class="make-center">
				<spr:form action="teamRegistration.htm" method="post"
					commandName="tournament">
					<spr:hidden path="tournamentId"  value="<%=tournament.getTournamentId()%>"/>
					<button class="btn btn-primary">Register</button>
				</spr:form>
			</div>
			<% }else if(request.getAttribute("currentUser")!=null && userRole.equals("Team Representative") && team.getTournamentId() == tournament.getTournamentId() ){ %>
			<div class="make-center">
				<a href="teamUnRegistration.htm" class="btn btn-primary ">
					Unregister</a>
			</div>
			<% } %>
		</div>
	</div>
	<br>

	</div>


	<%
		}
	}
%>



	<!--card end-->
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- //footer -->



	<!-- Modal5 -->
	<div class="modal fade" id="myModal5" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<div class="signin-form profile">
						<h3 class="agileinfo_sign">Register</h3>
						<div class="login-form">
							<form action="#" method="post">
								<input type="checkbox" name="player1" value="Player1">Player1<br>

								<input type="submit">
							</form>




						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Modal5 -->

	<!-- //bootstrap-pop-up -->

	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- Counter required files -->
	<script type="text/javascript" src="js/dscountdown.min.js"></script>
	<script src="js/demo-1.js"></script>
	<script>
        jQuery(document).ready(function ($) {
            $('.demo2').dsCountDown({
                endDate: new Date("December 24, 2020 23:59:00"),
                theme: 'black'
            });
        });
    </script>
	<!-- //Counter required files -->



	<script src="js/mainScript.js"></script>
	<script src="js/rgbSlide.min.js"></script>
	<!-- carousal -->
	<script src="js/slick.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
        $(document).on('ready', function () {
            $(".center").slick({
                dots: true,
                infinite: true,
                centerMode: true,
                slidesToShow: 2,
                slidesToScroll: 2,
                responsive: [
                    {
                        breakpoint: 768,
                        settings: {
                            arrows: true,
                            centerMode: false,
                            slidesToShow: 2
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            arrows: true,
                            centerMode: false,
                            centerPadding: '40px',
                            slidesToShow: 1
                        }
                    }
                ]
            });
        });
    </script>
	<!-- //carousal -->
	<!-- flexisel -->
	<script type="text/javascript">
        $(window).load(function () {
            $("#flexiselDemo1").flexisel({
                visibleItems: 4,
                animationSpeed: 1000,
                autoPlay: true,
                autoPlaySpeed: 3000,
                pauseOnHover: true,
                enableResponsiveBreakpoints: true,
                responsiveBreakpoints: {
                    portrait: {
                        changePoint: 480,
                        visibleItems: 1
                    },
                    landscape: {
                        changePoint: 640,
                        visibleItems: 2
                    },
                    tablet: {
                        changePoint: 768,
                        visibleItems: 2
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
        $(window).load(function () {
            $.fn.lightspeedBox();
        });
    </script>
	<!-- //gallery-pop-up -->
	<!-- flexSlider -->
	<script defer src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                start: function (slider) {
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