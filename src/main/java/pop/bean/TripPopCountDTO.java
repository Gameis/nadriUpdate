package pop.bean;

import lombok.Data;

@Data
public class TripPopCountDTO {
	private int total_review;
	private double avg_score;
	private int total_positiveReview;
	private int total_negativeReview;
	private int total_photo;
}
