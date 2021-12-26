package main.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class TripMainImgDTO {
	private int img_seq;
	private String img_name;
	private String img_path;
	private int content_seq;
	private int seq;
	private String main_seq;
	private String mainImg;
	private String main_name;
}
