package area.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class TripPopMapDTO {

	private int pop_seq;
	private String address_name;
	private double map_x;
	private double map_y;
}
