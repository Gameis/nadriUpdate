package area.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class TripPopDTO {
	private int pop_seq;
	private String pop_name;
	private String pop_businessTime;
	private String pop_tourismTime;
	private String pop_call;
	private String detailInfo;
	private String main_seq;
}
