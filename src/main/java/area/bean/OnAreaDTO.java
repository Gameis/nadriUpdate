package area.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OnAreaDTO {
	private String main_seq;
	private String main_name;
	private String main_info;
	private String img_name;
	private String img_path;
	private String mainImg;
}
