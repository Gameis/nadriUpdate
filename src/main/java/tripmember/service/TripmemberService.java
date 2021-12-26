package tripmember.service;

import java.util.List;

import tripmember.bean.TripmemberDTO;
import tripmember.bean.ZipcodeDTO;

public interface TripmemberService {
	
//	public MemberDTO login(Map<String, String> map);
	
	public TripmemberDTO login(TripmemberDTO tripmemberDTO);
	
	public void write(TripmemberDTO tripmemberDTO);

	public String checkId(String id);
	
	public String checkNickName(String nickName);

//이메일 인증 이건 못했음
//	public String checkEmail(String email);
	
	public List<ZipcodeDTO> checkPostSearch(ZipcodeDTO zipcodeDTO);
	
//Json 형식
//	public JSONObject getUserList();
	
//JSON 쓰지 않고 list형식으로 쓸때	
//	public List<MemberDTO> getUserList();

//	public MemberDTO getUser(String searchId);

	
	public TripmemberDTO getTripmemberInfo(String id);

	public void modify(TripmemberDTO tripmemberDTO);

	public void delete(String id);

	public void imgModify(TripmemberDTO tripmemberDTO);



	






}
