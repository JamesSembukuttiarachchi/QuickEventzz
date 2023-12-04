package com.event;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class DeleteEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String event_id = request.getParameter("event_id");
		
		boolean isTrue;
		
		isTrue = CreateEventUtil.DeleteEvent(event_id);
		
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
