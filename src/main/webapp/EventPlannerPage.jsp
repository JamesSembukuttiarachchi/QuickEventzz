<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	
	 <%@ page import="java.sql.*"%>
	 <%@ page import="com.event.*, java.util.*, java.io.*" %>
	 <%@ page import="java.util.*" %>
	 <%@ page import="java.io.*" %>
    
<!DOCTYPE html>
<html>
<head>

	<meta charset="ISO-8859-1">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IF=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Planner's Dashboard</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/event-planner-styles.css">
    <script src="scripts/eventCreate.js"></script>
    <script src="scripts/addGuests.js"> </script>
    
</head>

<body>

	<nav>
        <div class="container">
            <div>
                <h2 class="planner-name">
                    planner-name
                </h2>
            </div>
            <div class="search-bar">
                <i class="uil uil-search"></i>
                <input type="search" placeholder="Search Events">
            </div>
            <div class="create-event">
                <a href= "CreateEvent.jsp">
                	<button class="btn btn-primary" for="create-event" type="button" id="createButton">Create Event</button>
                </a>                             
            </div>
            <div class="profile-pic">
                <img src="images/profile-icon-1.png" alt="Me">
            </div>
        </div>
    </nav>
    
    <main>

        <div class="events-container">
            <h1>Upcoming Events</h1>           
            
	            <c:forEach var="event" items="${eventDetails}">
	                        
		            <c:set var="event_id" value="${event.event_id}"/>
		            <c:set var="event_name" value="${event.event_name}"/>
		            <c:set var="event_description" value="${event.event_description}"/>
		            <c:set var="event_date" value="${event.event_date}"/>
		            <c:set var="event_timr" value="${event.event_time}"/>
		            <c:set var="event_venue" value="${event.event_venue}"/>
		            <c:set var="event_guests" value="${event.event_guests}"/>
		            <c:set var="event_organizer" value="${event.event_organizer}"/>
		            
		            
		            ${event.event_id}
		            ${event.event_name}
		            ${event.event_description}
		            ${event.event_date}
		            ${event.event_time}
		            ${event.event_venue}
		            ${event.event_guests}
		            ${event.event_organizer}
	            
	            </c:forEach>
            	
            	<C:url value="UpdateEvent.jsp" var="eventUpdate">
            		<C:param name="event_id" value="${event_id}"/>
            		<C:param name="event_name" value="${event_name}"/>
            		<C:param name="event_description" value="${event_description}"/>
            		<C:param name="event_date" value="${event_date}"/>
            		<C:param name="event_timr" value="${event_timr}"/>
            		<C:param name="event_venue" value="${event_venue}"/>
            		<C:param name="event_guests" value="${event_guests}"/>
            		<C:param name="event_organizer" value="${event_organizer}"/>
            	</C:url>
            	           	
            
            <%
						try
						{
							
							Connection conn= DBConnect.getConnection();
							
							String query="select * from event_details";
							Statement stmt=conn.createStatement();
							
							
							ResultSet rs=stmt.executeQuery(query);
							while(rs.next())
							{	
							%>	
							<div style="justify-content: center;" class="cards">
								<div class="card">
									<div class="image-container">
						                <img id="event-image" src="images/event-image.jpeg" alt="Event"> <br>
						                <h3><%=rs.getString(2) %></h3><br>
										<p><%=rs.getString(3) %></p><br>
										<h5>On</h5><h4><%=rs.getString(4) %></h4><br><h5>At</h5> <h4><%=rs.getString(5) %></h4><br>
										<h4><%=rs.getString(6) %></h4><br>
										<h4><%=rs.getString(7) %></h4><br>
										<h4><%=rs.getString(8) %></h4><br><br>
										
										<div style="display: flex; justify-content: space-evenly">
											<div>
												<form action="UpdateEvent.jsp" method="post">
												<input type="hidden" name="id" value="<%=rs.getString(1)%>"/>
												<button class="btn btn-primary" for="edit-event" type="submit" id="editButton">Update</button>
												</form>
											</div>
											
											<div>
												<C:url value="DeleteEvent.jsp" var="eventDelete">
												<C:param name="event_id" value="${event_id}"/>
							            		<C:param name="event_name" value="${event_name}"/>
							            		<C:param name="event_description" value="${event_description}"/>
							            		<C:param name="event_date" value="${event_date}"/>
							            		<C:param name="event_timr" value="${event_timr}"/>
							            		<C:param name="event_venue" value="${event_venue}"/>
							            		<C:param name="event_guests" value="${event_guests}"/>
							            		<C:param name="event_organizer" value="${event_organizer}"/>
							            		
												</C:url>
																								
													<form action="DeleteEventServlet" method="post">
													    <input type="hidden" name="event_id" value="<%=rs.getString(1)%>"/>
													    <button class="btn btn-primary delete-button" data-event-id="<%=rs.getString(1)%>" onclick="confirmDelete()">Delete</button>
													</form>																																					
											</div>											
										</div>																                
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
           
            	
             </div>           

    </main>
    
    <script>
		function confirmDelete(){
			var result = confirm("Are you sure?");
			
			if(result){
				document.getElementById("event-id").submit();
			}else{
				
			}
		}
	</script>
    
</body>
</html>