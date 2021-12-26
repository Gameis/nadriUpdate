package main.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class TripMainDTO {
	private String main_seq;
	private String main_name;
	private String main_info;
}
