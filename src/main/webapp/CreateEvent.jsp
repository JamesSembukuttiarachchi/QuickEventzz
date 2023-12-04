<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IF=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Event</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/event-planner-styles.css"> 
    <script src="scripts/eventCreate.js"></script>
    <script src="scripts/addGuests.js"> </script>
</head>

<body>
	<div class="forms-container">
		<div id="createEvent" class="form-container">
	        <div class="CreateEventcontainer">
	        <center><h2>Creating a New Event</h2></center><br>
	            <form action="eventform" method="post">
	                <label for="eventName">Event Name:</label><br>
	                <input type="text" id="eventName" name="eventName" required><br>
	
					<label for="eventAbout"> Event Description:</label><br>
	    			<textarea id="eventAbout" name="eventAbout" cols="40" rows="5" required></textarea><br>
					
	                <label for="eventDate">Event Date:</label><br>
	                <input type="date" id="eventDate" name="eventDate" required><br><br>
	
	                <label for="eventTime">Event Time:</label><br>
	                <input type="time" id="eventTime" name="eventTime" required><br><br>
	
	                <label for="eventVenue">Venue:</label><br>
	                <input type="text" id="eventVenue" name="eventVenue" required><br><br>
	                
	                <label for="eventGuests">Guests:</label><br>
	                <input type="text" id="eventGuests" name="eventGuests" required><br><br>
	                
				    <label for="organizer">Organizer:</label><br>
	                <input type="text" id="organizer" name="organizer" required><br>
					
					<center><input class="btn btn-primary" type="submit" value="Create"></center>
	            </form>
			</div>            
        </div>
    </div>

</body>
</html>