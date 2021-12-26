package pop.bean;

import lombok.Data;

@Data
public class TripPopLocationDTO {
	private int pop_seq;//명소고유번호
	private String pop_name;//명소이름
	private String pop_businesstime;//영업시간
	private String pop_tourismtime;//추천관광시간
	private String pop_call;//명소전화번호??
	private String address_name;
	private String map_x;
	private String map_y;
	private String detailInfo;
	private String main_seq;
	private String main_name;
}
