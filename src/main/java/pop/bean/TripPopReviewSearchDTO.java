package pop.bean;

import lombok.Data;

@Data
public class TripPopReviewSearchDTO {
	private int pageNum;
	private String searchType;
    private String isDesc;
    private String pop_seq;
}
