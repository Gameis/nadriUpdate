package tripmember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tripmember.bean.TripmemberDTO;
import tripmember.bean.ZipcodeDTO;
import tripmember.dao.TripmemberDAO;

@Service	//@Component	 이것도 되지만 Service라고 직관적으로 알아볼수있록 하자
public class TripmemberServiceImpl implements TripmemberService {
 
	@Autowired
	private TripmemberDAO tripmemberDAO;
	
	/*
	@Override
	public TripmemberDTO login(Map<String, String> map) {
		return tripmemberDAO.login(map);
	}
	*/
	
	@Override
	public TripmemberDTO login(TripmemberDTO tripmemberDTO) {
		
		
		return tripmemberDAO.login(tripmemberDTO);

	}
	
	@Override
	public List<ZipcodeDTO> checkPostSearch(ZipcodeDTO zipcodeDTO) {
		return tripmemberDAO.checkPostSearch(zipcodeDTO);
	}

	@Override
	public String checkId(String id) {

		TripmemberDTO tripmemberDTO=tripmemberDAO.checkId(id);
		
		if(tripmemberDTO==null)
			return "non-exist";
		else {
			return "exist";
		}
		
	}	//checkId
	
	@Override
	public String checkNickName(String nickName) {

		TripmemberDTO tripmemberDTO=tripmemberDAO.checkNickName(nickName);
		
		if(tripmemberDTO==null)
			return "non-exist";
		else {
			return "exist";
		}
		
	}	//checkId
	
	
	// 회원가입
	@Override
	public void write(TripmemberDTO tripmemberDTO) {
	//	System.out.println("1번 연결됬니"+tripmemberDTO);
		tripmemberDAO.write(tripmemberDTO);		
	}
	 
	
	@Override
	public TripmemberDTO getTripmemberInfo(String id) {
		return tripmemberDAO.getTripmemberInfo(id);
	}


	
	@Override
	public void modify(TripmemberDTO tripmemberDTO) {
		tripmemberDAO.modify(tripmemberDTO);
	}
	
	@Override
	public void delete(String id) {
		tripmemberDAO.delete(id);	
	}

	@Override
	public void imgModify(TripmemberDTO tripmemberDTO) {
	
		tripmemberDAO.imgModify(tripmemberDTO);
	}










	
}	//클래스
