package com.event;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UpdateEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String event_id = request.getParameter("event_id");
		String event_name = request.getParameter("event_name");
		String event_description = request.getParameter("event_description");
		String event_date = request.getParameter("event_date");
		String event_time = request.getParameter("event_time");
		String event_venue = request.getParameter("event_venue");
		String event_guests = request.getParameter("event_guests");
		String event_organizer = request.getParameter("event_organizer");
		
		boolean isTrue;
		
		isTrue = CreateEventUtil.UpdateEvent(event_id, event_name, event_description, event_date, event_time, event_venue, event_guests, event_organizer);
		
		if(isTrue == true) {
			
			//direct the user to the main page
			RequestDispatcher dis = request.getRequestDispatcher("EventPlannerPage.jsp");
			dis.forward(request, response);
		}
		else{
			
			//give the unsuccess message
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
		
	}

}
