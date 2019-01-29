<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dto.Team"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="zxx">
<head>







<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/ju-1.11.4/jqc-1.11.3,dt-1.10.8/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/r/ju-1.11.4/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<script type="text/javascript" charset="utf-8"
	style="table-layout: fixed; background-color: black;">
	$(document).ready(function() 
{
		$('#example').dataTable();
	});
</script>


<title>Insert title here</title>

<style>
ui-widget-header {
    border: 1px solid #e78f08;
    background: #494949
</style>
</head>
<body>






	<div class="container" >
		<div class="row ">


			<div class="col-md-12">
				<h4 style="align-content: center;">Team List</h4>
				<div class="table-responsive">
					<form action="/cricstatz/index.jsp" class="inline">
						<button class="btn btn-primary" style="margin-bottom: 5px">Back</button>
					</form>

					<table id="example" class="table table-bordred table-striped"
						style="background-color: black;">
						<thead>

							<th>Team Id</th>
							<th>Team Name</th>
							<th>Match Date</th>
							<th>Total Matches</th>
							<th>Score</th>


						</thead>
						<tbody>
							<%  
		
		List<Team> list = (List<Team>)request.getAttribute("teamList");
		if(list!=null)
		{
			for(Team team: list)
			{
		
		%>



							<tr>
								<td><%=team.getTeamId() %></td>
								<td><%=team.getTeamName()%></td>
								<td><%=team.getMatchDate() %></td>
								<td><%=team.getTotalMatches()%></td>
								<td><%=team.getTeamScore() %></td>




							</tr>



							<%
		}
	}
%>
						
					</table>
				</div>


			</div>
		</div>
	</div>










</body>

</html>