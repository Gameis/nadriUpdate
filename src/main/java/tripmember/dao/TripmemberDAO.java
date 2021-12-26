package tripmember.dao;

import java.util.List;

import tripmember.bean.TripmemberDTO;
import tripmember.bean.ZipcodeDTO;

public interface TripmemberDAO {
	
//	public MemberDTO login(Map<String, String> map);
	
	public TripmemberDTO login(TripmemberDTO tripmemberDTO);

	public TripmemberDTO checkId(String id);
	
	public TripmemberDTO checkNickName(String nickName);
		
	public List<ZipcodeDTO> checkPostSearch(ZipcodeDTO zipcodeDTO);
	
	public void write(TripmemberDTO tripmemberDTO);
	
	/*
	public List<MemberDTO> getUserList();

	public MemberDTO getUser(String searchId);
	*/
	
	public TripmemberDTO getTripmemberInfo(String id);
	
	public void modify(TripmemberDTO memeberDTO);

	public void delete(String id);

	public void imgModify(TripmemberDTO tripmemberDTO);






	

}
