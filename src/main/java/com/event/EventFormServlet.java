package com.event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;


@WebServlet("/eventform")
public class EventFormServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String eventName = request.getParameter("eventName");
        String eventAbout = request.getParameter("eventAbout");
        String eventDate = request.getParameter("eventDate");
        String eventTime = request.getParameter("eventTime");
        String eventVenue = request.getParameter("eventVenue");
        String eventOrganizer = request.getParameter("organizer");
        String eventGuests = request.getParameter("eventGuests"); 
        
        boolean isTrue;
        
        isTrue = CreateEventUtil.CreateEvent(eventName, eventAbout, eventDate, eventTime, eventVenue, eventGuests, eventOrganizer);
        
        if(isTrue == true) {
        	
        	//direct the user to the main page
        	RequestDispatcher dis1 = (RequestDispatcher) request.getRequestDispatcher("EventPlannerPage.jsp");
        	dis1.forward(request, response);
        }
        else {
        	
        	//give the unsuccess message
        	RequestDispatcher dis2 = (RequestDispatcher) request.getRequestDispatcher("unsuccess.jsp");
        	dis2.forward(request, response);
        }

    }
}

