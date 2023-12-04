<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	 <%@page import="java.sql.*"%>
	 <%@ page import="com.event.*, java.util.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IF=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Event Details</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link rel="stylesheet" href="styles/event-planner-styles.css">
    <script src="scripts/eventCreate.js"></script>
    <script src="scripts/addGuests.js"> </script>
</head>
<body>



	<%
		String event_id = request.getParameter("event_id");
		String event_name = request.getParameter("event_name");
		String event_description = request.getParameter("event_description");
		String event_date = request.getParameter("event_date");
		String event_time = request.getParameter("event_time");
		String event_venue = request.getParameter("event_venue");
		String event_guests = request.getParameter("event_guests");
		String event_organizer = request.getParameter("event_organizer");
	%>
	
	<%String val = request.getParameter("id"); %>
	
	<%
						try
						{
							Class.forName("com.mysql.jdbc.Driver");
							String url="jdbc:mysql://localhost:3306/eventdb";
							String username="root";
							String password="DBpassword";
							Connection conn=DriverManager.getConnection(url,username,password);
							Statement stmt=conn.createStatement();
							
							
							String query="select * from event_details where event_id='"+val+"'";
							
							ResultSet rs=stmt.executeQuery(query);
							while(rs.next())
							{	
							%>	
							
							<div id="updateEvent" class="updateEvent">
							<div class="forms-container">
									<div class="form-container">
									<center><h2>Updating the Event</h2></center><br>
										<form action="UpdateEventServlet"  method="post">
							                <label for="eventName">Event Name:</label><br>
							                <input type="hidden" id="eventName" name="event_id" value="<%=rs.getString(1) %>">
							                <input type="text" id="eventName" name="event_name" value="<%=rs.getString(2) %>"><br><br>
							
											<label for="eventAbout"> Event Description:</label><br>
							    			<input id="eventAbout" name="event_description" cols="40" rows="5" value="<%=rs.getString(3) %>"/><br><br>
											
							                <label for="eventDate">Event Date:</label><br>
							                <input type="date" id="eventDate" name="event_date" value="<%=rs.getString(4) %>"><br><br>
							
							                <label for="eventTime">Event Time:</label><br>
							                <input type="time" id="eventTime" name="event_time" value="<%=rs.getString(5) %>"><br><br>
							
							                <label for="eventVenue">Venue:</label><br>
							                <input type="text" id="eventVenue" name="event_venue" value="<%=rs.getString(6) %>"><br><br>
							                
											<label for="eventGuests">Guests:</label><br>
							                <input type="text" id="eventGuests" name="event_guests" value="<%=rs.getString(7) %>"><br><br>
							
										    <label for="organizer">Organizer:</label><br>
							                <input type="text" id="organizer" name="event_organizer" value="<%=rs.getString(8) %>"><br><br>
											
							                <center><input class="btn btn-primary" type="submit" value="Finish"></center>
							                
							            </form>
									</div>								
							</div>		
	</div>
												
								
							<%
							
							}
							%>
								<%
								rs.close();
								stmt.close();
								conn.close();
								}
							catch(Exception e)
							{
								e.printStackTrace();
								}
						%>

	
	

</body>
</html>