package pop.bean;

import java.util.List;

import lombok.Data;

@Data
public class TripPopReviewContentDTO {
	private int pop_review_seq;
	private String profileImg;
	private String nickname;
	private int review_score;
	private String review_content;
	private String img_path;
	private String review_logtime;
	private List<TripPopReviewImgDTO> imgList;
}
