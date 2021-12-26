package tripmoment.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class TripViewDTO {
	private String moment_seq;
	private String moment_title;
	private String moment_content;
	private String moment_logdate;
	private String pop_name;
	private String name;
	private String id;
	private String nickname;
}
