package activities.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import activities.bean.OnActivitiesDTO;
import activities.bean.TripActReviewCntDTO;
import activities.bean.TripActReviewDTO;
import activities.bean.TripActReviewListDTO;
import activities.bean.TripActReviewUserDTO;
import activities.dao.ActivitiesDAO;

@Component
public class ActivitiesServiceimpl implements ActivitiesService {
	@Autowired
	private ActivitiesDAO activitiesDAO;

	@Override
	public OnActivitiesDTO onActivities(String activity_seq) {
		return activitiesDAO.onActivities(activity_seq);
	}

	@Override
	public TripActReviewDTO actReviewWrite(TripActReviewDTO tripActReviewDTO) {
		return activitiesDAO.actReviewWrite(tripActReviewDTO);
	}

	@Override
	public TripActReviewCntDTO getActReviewCnt(String activity_seq) {
		return activitiesDAO.getActReviewCnt(activity_seq);
	}

	@Override
	public TripActReviewUserDTO getActReviewUserInfo(TripActReviewUserDTO tripActReviewUserDTO) {
		return activitiesDAO.getActReviewUserInfo(tripActReviewUserDTO);
	}

	@Override
	public int getReviewContentCnt(String activity_seq) {
		return activitiesDAO.getReviewContentCnt(activity_seq);
	}

	@Override
	public Object getReviewContent(Map<String, Object> activityMap) {
		return activitiesDAO.getReviewContent(activityMap);
	}

	
}
