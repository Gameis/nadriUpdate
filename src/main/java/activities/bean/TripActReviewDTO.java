package activities.bean;

import lombok.Data;

@Data
public class TripActReviewDTO {
	private int member_seq;
	private String activity_review_content;
	private int activity_review_seq;
	private int activity_review_score;
	private String activity_review_logtime;
	private int activity_seq;
	private int main_seq;
}
