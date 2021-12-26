package tripmoment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tripmoment.bean.TripmomentCommentDTO;

@Repository
@Transactional
public class TripmomentCommentDAOMybatis implements TripmomentCommentDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TripmomentCommentDTO> tripmomentCommentGetList(String moment_seq) {

		return sqlSession.selectList("tripmomentCommentSQL.tripmomentCommentGetList", moment_seq);
	}

	@Override
	public void tripmomentCommentWrite(TripmomentCommentDTO tripmomentCommentDTO) {
		sqlSession.insert("tripmomentCommentSQL.tripmomentCommentWrite", tripmomentCommentDTO);
	}
}
