package area.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ActivityMainDTO {
	private int activity_seq;
	private String activity_name;
	private int activity_saleRate;
	private int price;
	private String img_name;
	private String img_path;
}
