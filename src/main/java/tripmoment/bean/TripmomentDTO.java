package tripmoment.bean;

import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
@NotNull
public class TripmomentDTO {
	private int moment_seq;
	private String moment_title;
	private String moment_content;
	private Date moment_logdate;
	private String pop_name;
	private String member_seq;

}