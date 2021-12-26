package activities.bean;

import lombok.Data;

@Data
public class TripActReviewListDTO {
	private int activity_review_seq;
	private String nickName;
	private String profileImg;
	private int activity_review_score;
	private String activity_review_logtime;
	private String activity_review_content;
}
