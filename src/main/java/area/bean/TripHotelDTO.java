package area.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class TripHotelDTO {
	public String hotel_seq;
	public String hotel_name;
	public String hotel_address;
	public String hotel_year;
	public String hotel_remodeling;
	public String hotel_room;
	public String hotel_info;
	public String hotel_clean;
	public String hotel_facility;
	public String hotel_location;
	public String hotel_service;
	public String main_seq;
}
