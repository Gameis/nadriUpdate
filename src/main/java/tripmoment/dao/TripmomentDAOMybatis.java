package tripmoment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import area.bean.ImgDTO;
import area.bean.TripPopDTO;
import tripmoment.bean.MainTripmomentDTO;
import tripmoment.bean.TripImgDTO;
import tripmoment.bean.TripViewDTO;
import tripmoment.bean.TripmomentDTO;

@Repository
@Transactional
public class TripmomentDAOMybatis implements TripmomentDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void tripmoment_writeForm(ImgDTO imgDTO, String pop_name) {
		TripPopDTO tripPopDTO = sqlSession.selectOne("tripmomentSQL.getPop_seq", pop_name);
		imgDTO.setSeq(tripPopDTO.getPop_seq());
		imgDTO.setMain_seq(tripPopDTO.getMain_seq());
		sqlSession.insert("tripmomentSQL.getTripmomentImg", imgDTO);
	}

	@Override
	public void tripmoment_write(TripmomentDTO tripmomentDTO) {
		sqlSession.insert("tripmomentSQL.tripmoment_write", tripmomentDTO);
	}

	@Override
	public List<MainTripmomentDTO> onTripmoment() {
		return sqlSession.selectList("tripmomentSQL.onTripmoment");
	}

	@Override
	public List<TripImgDTO> getTripImg(String moment_seq) {
		return sqlSession.selectList("tripmomentSQL.getTripImg", moment_seq);
	}

	@Override
	public TripViewDTO getTripView(String moment_seq) {
		return sqlSession.selectOne("tripmomentSQL.getTripView", moment_seq);		
	}

	@Override
	public List<MainTripmomentDTO> onReTripmoment(String moment_seq) {
		return sqlSession.selectList("tripmomentSQL.onReTripmoment", moment_seq);		
	}
}
