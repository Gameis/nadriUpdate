package pop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pop.bean.TripPopCountDTO;
import pop.bean.TripPopImgDTO;
import pop.bean.TripPopLocationDTO;
import pop.bean.TripPopReviewContentDTO;
import pop.bean.TripPopReviewDTO;
import pop.bean.TripPopReviewImgDTO;
import pop.bean.TripPopReviewSearchDTO;
import pop.bean.TripPopUserInfoDTO;

@Repository
@Transactional
public class PopDAOMybatis implements PopDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public TripPopLocationDTO getLocation(Map<String, Object> resultMap) {
		
		return sqlSession.selectOne("popSQL.getLocation", resultMap);
	}

	@Override
	public List<TripPopImgDTO> getPopImg(int pop_seq) {
		List<TripPopImgDTO> list = sqlSession.selectList("popSQL.getPopImg", pop_seq);
		return list;
	}

	@Override
	public void popReviewImgWrite(TripPopImgDTO tripPopImgDTO) {
		sqlSession.insert("popSQL.popReviewImgWrite", tripPopImgDTO);
	}

	@Override
	public void popReviewWrite(TripPopReviewDTO tripPopReviewDTO) {
		sqlSession.insert("popSQL.popReviewWrite", tripPopReviewDTO);
	}

	@Override
	public TripPopCountDTO getCountView(String pop_seq) {
		
		return sqlSession.selectOne("popSQL.getCountView", pop_seq);
	}
	
	@Override
	public int getReviewContentCnt(TripPopReviewSearchDTO tripPopReviewSearchDTO) {
		return sqlSession.selectOne("popSQL.getReviewContentCnt", tripPopReviewSearchDTO);
	}

	@Override
	public List<TripPopReviewContentDTO> getReviewContent(TripPopReviewSearchDTO tripPopReviewSearchDTO) {
		return sqlSession.selectList("popSQL.getReviewContent", tripPopReviewSearchDTO);
	}

	@Override
	public Object getReviewContentPhotoCnt(TripPopReviewSearchDTO tripPopReviewSearchDTO) {
		return sqlSession.selectOne("popSQL.getReviewContentPhotoCnt", tripPopReviewSearchDTO);
	}

	@Override
	public Object getReviewContentPhoto(TripPopReviewSearchDTO tripPopReviewSearchDTO) {
		return sqlSession.selectList("popSQL.getReviewContentPhoto", tripPopReviewSearchDTO);
	}

	@Override
	public List<TripPopReviewImgDTO> getReviewContentPhotoList(TripPopReviewSearchDTO tripPopReviewSearchDTO) {
		return sqlSession.selectList("popSQL.getReviewContentPhotoList", tripPopReviewSearchDTO);
	}

	@Override
	public TripPopUserInfoDTO getUserInfo(String member_seq) {
		return sqlSession.selectOne("popSQL.getUserInfo", member_seq);
	}

	
	
	
	
}
