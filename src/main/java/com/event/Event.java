package com.event;

public class Event {
	
	//data members
	private int event_id;
	private String event_name;
	private String event_description;
	private String event_date;
	private String event_time;
	private String event_venue;
	private String event_guests;
	private String event_organizer;
	
	//overloading constructor
	public Event(int event_id, String event_name, String event_description, String event_date, String event_time,
			String event_venue, String event_guests, String event_organizer) {
		super();
		this.event_id = event_id;
		this.event_name = event_name;
		this.event_description = event_description;
		this.event_date = event_date;
		this.event_time = event_time;
		this.event_venue = event_venue;
		this.event_guests = event_guests;
		this.event_organizer = event_organizer;
	}
	
	//getters
	public int getEvent_id() {
		return event_id;
	}

	public String getEvent_name() {
		return event_name;
	}

	public String getEvent_description() {
		return event_description;
	}

	public String getEvent_date() {
		return event_date;
	}

	public String getEvent_time() {
		return event_time;
	}

	public String getEvent_venue() {
		return event_venue;
	}

	public String getEvent_guests() {
		return event_guests;
	}

	public String getEvent_organizer() {
		return event_organizer;
	}

}
