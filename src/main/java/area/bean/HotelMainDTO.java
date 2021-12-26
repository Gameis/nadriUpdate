package area.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class HotelMainDTO {
	private String hotel_seq; 
	private String hotel_name;
	private String hotel_address; 
	private String hotel_year; 
	private String hotel_remodeling; 
	private String hotel_room; 
	private String hotel_info; 
	private String hotel_clean; 
	private String hotel_facility; 
	private String hotel_location; 
	private String hotel_service; 
	private String main_seq;
	private String img_name; 
	private String img_path;
}
