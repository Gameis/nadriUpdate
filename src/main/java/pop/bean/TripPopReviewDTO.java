package pop.bean;

import lombok.Data;

@Data
public class TripPopReviewDTO {
	private String member_seq;
	private String pop_review_content;
	private int pop_review_seq;
	private int pop_review_score;
	private String pop_review_logtime;
	private int pop_seq;
	private int main_seq;
}
