package tripmember.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tripmember.bean.TripmemberDTO;
import tripmember.bean.ZipcodeDTO;

@Repository //	@Component써줘도 되지만 직관적으로 DB관련쪽이라고 알려주자
@Transactional
public class TripmemberDAOMybatis implements TripmemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
//	@Autowired
//	BCryptPasswordEncoder passwordEncoder;

/*
	@Override
	public TripmemberDTO login(Map<String, String> map) {
		//System.out.println(map.get("id") + "," + map.get("pwd"));
		return sqlSession.selectOne("memberSQL.login",map);
	}
	*/
	
	@Override
	public TripmemberDTO login(TripmemberDTO tripmemberDTO) {
		return sqlSession.selectOne("tripmemberSQL.login",tripmemberDTO);
	}

	
	@Override
	public TripmemberDTO checkId(String id) {
		return sqlSession.selectOne("tripmemberSQL.checkId",id);
	}
	
	@Override
	public TripmemberDTO checkNickName(String nickName) {
		return sqlSession.selectOne("tripmemberSQL.checkNickName",nickName);
	}
	
	
	@Override
	public List<ZipcodeDTO> checkPostSearch(ZipcodeDTO zipcodeDTO) {
		return sqlSession.selectList("tripmemberSQL.checkPostSearch",zipcodeDTO);
	}

	@Override
	public void write(TripmemberDTO tripmemberDTO) {
		System.out.println("2번 연결됫니"+tripmemberDTO);		
		sqlSession.insert("tripmemberSQL.write",tripmemberDTO);
	}

	
	/*
	@Override
	public List<MemberDTO> getUserList() {	
		return sqlSession.selectList("tripmemberSQL.getUserList");
	}

	@Override
	public MemberDTO getUser(String searchId) {
		return sqlSession.selectOne("tripmemberSQL.getUser",searchId);
	}
	*/
		
	@Override
	public TripmemberDTO getTripmemberInfo(String id) {	
		return sqlSession.selectOne("tripmemberSQL.getTripmemberInfo", id);
	}
	
	@Override
	public void modify(TripmemberDTO tripmemberDTO) {
		System.out.println(tripmemberDTO);
		sqlSession.update("tripmemberSQL.modify",tripmemberDTO);
	}

	@Override
	public void delete(String id) {
		sqlSession.delete("tripmemberSQL.delete",id);
		
	}


	@Override
	public void imgModify(TripmemberDTO tripmemberDTO) {

		System.out.println(tripmemberDTO);
		sqlSession.update("tripmemberSQL.imgModify",tripmemberDTO);
	}



	
}	//클래스
