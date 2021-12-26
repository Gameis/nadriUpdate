package activities.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import activities.bean.OnActivitiesDTO;
import activities.bean.TripActReviewCntDTO;
import activities.bean.TripActReviewDTO;
import activities.bean.TripActReviewListDTO;
import activities.bean.TripActReviewUserDTO;

@Repository
@Transactional
public class ActivitiesDAOMybatis implements ActivitiesDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public OnActivitiesDTO onActivities(String activity_seq) {
		System.out.println("activity_seq = " + activity_seq);
		return sqlSession.selectOne("activitiesSQL.onActivities", activity_seq);
	}

	@Override
	public TripActReviewDTO actReviewWrite(TripActReviewDTO tripActReviewDTO) {
		return sqlSession.selectOne("activitiesSQL.actReviewWrite", tripActReviewDTO);
	}

	@Override
	public TripActReviewCntDTO getActReviewCnt(String activity_seq) {
		return sqlSession.selectOne("activitiesSQL.getActReviewCnt", activity_seq);
	}

	@Override
	public TripActReviewUserDTO getActReviewUserInfo(TripActReviewUserDTO tripActReviewUserDTO) {
		return sqlSession.selectOne("activitiesSQL.getActReviewUserInfo", tripActReviewUserDTO);
	}

	@Override
	public int getReviewContentCnt(String activity_seq) {
		return sqlSession.selectOne("activitiesSQL.getReviewContentCnt", activity_seq);
	}

	@Override
	public Object getReviewContent(Map<String, Object> activityMap) {
		return sqlSession.selectList("activitiesSQL.getReviewContent", activityMap);
	}


}
