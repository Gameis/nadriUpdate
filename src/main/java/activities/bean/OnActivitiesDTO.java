package activities.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OnActivitiesDTO {
	private int activity_seq;
	private String activity_name;
	private String activity_point;
	private String activity_price;
	private String activity_saleRate;
	private String activity_option;
	private String activity_validDate;
	private String activity_inclusion;
	private String activity_refund;
	private String activity_used;
	private String activity_information;
	private String activity_warning;
	private int main_seq;
	private String main_img;
	private String sub_img;

}
