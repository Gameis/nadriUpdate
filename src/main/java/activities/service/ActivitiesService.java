package activities.service;

import java.util.List;
import java.util.Map;

import activities.bean.OnActivitiesDTO;
import activities.bean.TripActReviewCntDTO;
import activities.bean.TripActReviewDTO;
import activities.bean.TripActReviewListDTO;
import activities.bean.TripActReviewUserDTO;

public interface ActivitiesService {
	public OnActivitiesDTO onActivities(String activity_seq);

	public TripActReviewDTO actReviewWrite(TripActReviewDTO tripActReviewDTO);

	public TripActReviewCntDTO getActReviewCnt(String activity_seq);

	public TripActReviewUserDTO getActReviewUserInfo(TripActReviewUserDTO tripActReviewUserDTO);

	public int getReviewContentCnt(String activity_seq);

	public Object getReviewContent(Map<String, Object> activityMap);


}
