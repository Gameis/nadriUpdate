package tripmoment.bean;

import lombok.Data;

@Data
public class TripmomentCommentDTO {
	private String moment_comment_seq;
	private String member_seq;
	private String moment_comment;
	/* @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd") */
	private String moment_comment_logtime;
	private String moment_seq;
	private String nickname;

}
