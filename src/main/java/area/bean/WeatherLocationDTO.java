package area.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class WeatherLocationDTO {
	private String firstLoaction;
	private String secondLocation;
	private String location_x;
	private String location_y;
}
