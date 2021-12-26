package area.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import area.bean.HotelMainDTO;
import area.bean.ImgDTO;
import area.bean.OnAreaDTO;
import area.bean.PopMainDTO;
import area.bean.TripActivityDTO;
import area.bean.TripHotelDTO;
import area.bean.TripPopDTO;
import area.bean.TripPopMapDTO;

@Repository
@Transactional
public class AreaDAOMybatis implements AreaDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void imgPopWrite(ImgDTO imgDTO) {
		sqlSession.insert("areaSQL.imgPopWrite", imgDTO);
	}

	@Override
	public void imgActivityWrite(ImgDTO imgDTO) {
		sqlSession.insert("areaSQL.imgActivityWrite", imgDTO);
	}
	
	@Override
	public void popWrite(TripPopDTO tripPopDTO, TripPopMapDTO tripPopMapDTO) {
		sqlSession.insert("areaSQL.popWrite", tripPopDTO);
		sqlSession.insert("areaSQL.popMap", tripPopMapDTO);
	}
	
	@Override
	public void activityWrite(TripActivityDTO tripActivityDTO) {
		sqlSession.insert("areaSQL.activityWrite", tripActivityDTO);
	}

	@Override
	public List<PopMainDTO> printPopMain(String main_seq) {
		System.out.println("main_seq = " + main_seq);
		return sqlSession.selectList("areaSQL.printPopMain", main_seq);
	}

	@Override
	public List<PopMainDTO> printActivityMain(String main_seq) {
		return sqlSession.selectList("areaSQL.printActivityMain", main_seq);
	}

	@Override
	public List<OnAreaDTO> onArea(String main_seq) {
		return sqlSession.selectList("areaSQL.onArea", main_seq);
	}
	
	@Override
	public Map<String, String> search(String searchText) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("searchText = " + searchText);
		if(sqlSession.selectOne("areaSQL.searchArea", searchText) != null){
			System.out.println("=" + sqlSession.selectOne("areaSQL.searchArea", searchText));
			map.put("content_seq", "2");
			map.put("seq", sqlSession.selectOne("areaSQL.searchArea", searchText));
		}else if(sqlSession.selectOne("areaSQL.searchPop", searchText) != null) {
			map.put("content_seq", "3");
			map.put("seq", sqlSession.selectOne("areaSQL.searchPop", searchText));
		}else if(sqlSession.selectOne("areaSQL.searchActivity", searchText) != null) {
			map.put("content_seq", "5");
			map.put("seq", sqlSession.selectOne("areaSQL.searchActivity", searchText));
		}else {
			map.put("content_seq", "없음");
			map.put("seq", "없음");
		}
		return map;
	}

	@Override
	public void hotelWrite(TripHotelDTO tripHotelDTO) {
		sqlSession.insert("areaSQL.hotelWrite", tripHotelDTO);
	}

	@Override
	public void imgHotelWrite(ImgDTO imgDTO) {
		sqlSession.insert("areaSQL.imgHotelWrite", imgDTO);
	}

	@Override
	public List<HotelMainDTO> onAreaHotel(String main_seq) {
		return sqlSession.selectList("areaSQL.onAreaHotel", main_seq);
	}
}
