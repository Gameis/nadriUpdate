package tripmember.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TripmemberDTO {

	private String member_seq;
	private String name;
	private String id;
	private String nickName;
	private String pwd;
	private String tel;
	private String email;
	private String zipcode;
	private String address;
	private String addressDetail;
	private String profileImg;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy년 MM월 dd일")
	private Date logtime;
}
