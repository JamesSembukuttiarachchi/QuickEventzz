package com.event;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class CreateEventUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	
	//method to create the event
	public static boolean CreateEvent(String eventName, String eventAbout, String eventDate, String eventTime, String eventVenue, String eventGuests, String organizer) {
    	boolean isSuccess = false;
    	   	
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		//query to insert details
    		String sql = "INSERT INTO event_details VALUES (0, '"+eventName+"', '"+eventAbout+"', '"+eventDate+"', '"+eventTime+"', '"+eventVenue+"', '"+eventGuests+"', '"+organizer+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch(Exception e) {			//error handling
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
	
	//method to update the event
	public static boolean UpdateEvent(String eventId, String eventName, String eventAbout, String eventDate, String eventTime, String eventVenue, String eventGuests, String organizer) {
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			//query to update details
			String sql = "update event_details set event_name='"+eventName+"', event_description='"+eventAbout+"', event_date='"+eventDate+"', event_time='"+eventTime+"', event_venue='"+eventVenue+"', event_guests='"+eventGuests+"', event_organizer='"+organizer+"'"
						+"where event_id='"+eventId+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {			//error handling
			e.printStackTrace();
			
		}
		
		return isSuccess;
	}
	
	
	//method to delete the event
	public static boolean DeleteEvent(String eventId) {
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			//query to delete details
			String sql = "DELETE FROM event_details WHERE event_id = '" + eventId + "'";

			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {			//error handling
			e.printStackTrace();
			
			
		}
		
		return isSuccess;
	}

}
