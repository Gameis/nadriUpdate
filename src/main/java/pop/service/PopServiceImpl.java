package pop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pop.bean.TripPopCountDTO;
import pop.bean.TripPopImgDTO;
import pop.bean.TripPopLocationDTO;
import pop.bean.TripPopReviewContentDTO;
import pop.bean.TripPopReviewDTO;
import pop.bean.TripPopReviewSearchDTO;
import pop.bean.TripPopUserInfoDTO;
import pop.dao.PopDAO;

@Service
public class PopServiceImpl implements PopService {
	@Autowired
	private PopDAO popDAO;
	
	@Override
	public TripPopLocationDTO getLocation(Map<String, Object> resultMap) {
		
		return popDAO.getLocation(resultMap);
	}

	@Override
	public List<TripPopImgDTO> getPopImg(int pop_seq) {
		
		return popDAO.getPopImg(pop_seq);
	}

	@Override
	public void popReviewImgWrite(TripPopImgDTO tripPopImgDTO) {
		
		popDAO.popReviewImgWrite(tripPopImgDTO);
	}

	@Override
	public void popReviewWrite(TripPopReviewDTO tripPopReviewDTO) {
		popDAO.popReviewWrite(tripPopReviewDTO);
	}

	@Override
	public TripPopCountDTO getCountView(String pop_seq) {
		return popDAO.getCountView(pop_seq);
	}
	
	@Override
	public int getReviewContentCnt(TripPopReviewSearchDTO tripPopReviewSearchDTO) {
		return popDAO.getReviewContentCnt(tripPopReviewSearchDTO);
	}

	@Override
	public List<TripPopReviewContentDTO> getReviewContent(TripPopReviewSearchDTO tripPopReviewSearchDTO) {	
		return popDAO.getReviewContent(tripPopReviewSearchDTO);
	}

	@Override
	public Object getReviewContentPhotoCnt(TripPopReviewSearchDTO tripPopReviewSearchDTO) {
		return popDAO.getReviewContentPhotoCnt(tripPopReviewSearchDTO);
	}

	@Override
	public Object getReviewContentPhoto(TripPopReviewSearchDTO tripPopReviewSearchDTO) {
		return popDAO.getReviewContentPhoto(tripPopReviewSearchDTO);
	}

	@Override
	public Object getReviewContentPhotoList(TripPopReviewSearchDTO tripPopReviewSearchDTO) {
		return popDAO.getReviewContentPhotoList(tripPopReviewSearchDTO);
	}

	@Override
	public TripPopUserInfoDTO getUserInfo(String member_seq) {
		return popDAO.getUserInfo(member_seq);
	}

}
