package activities.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import activities.bean.OnActivitiesDTO;
import activities.bean.TripActReviewCntDTO;
import activities.bean.TripActReviewDTO;
import activities.bean.TripActReviewUserDTO;
import activities.service.ActivitiesService;

@Controller
@RequestMapping(value = "/activities")
public class ActivitiesController {
	@Autowired
	private ActivitiesService activitiesService;

	@RequestMapping(value = "/onActivities", method = RequestMethod.GET)
	@ResponseBody
	public OnActivitiesDTO onActivities(@RequestParam("activity_seq") String activity_seq) {
		return activitiesService.onActivities(activity_seq);
	}
	
	@RequestMapping(value = "/actReviewWrite", method = RequestMethod.GET)
	@ResponseBody
	public void actReviewWrite(TripActReviewDTO tripActReviewDTO) {
		activitiesService.actReviewWrite(tripActReviewDTO);
	}
	
	
	@RequestMapping(value = "/getActReviewCnt", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getActReviewCnt(HttpSession session,
											   @ModelAttribute TripActReviewUserDTO tripActReviewUserDTO,
											   @ModelAttribute TripActReviewCntDTO tripActireviewCntDTO,
											   @RequestParam("activity_seq") String activity_seq) {
		System.out.println("member_seq = " + session.getAttribute("member_seq"));
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("reviewCnt", activitiesService.getActReviewCnt(activity_seq));
		
		if(session.getAttribute("member_seq") != null) {
			String member_seq = (String)session.getAttribute("member_seq");
			tripActReviewUserDTO.setMember_seq(member_seq);
			System.out.println("dto = " + tripActReviewUserDTO.getMember_seq());
			resultMap.put("userInfo", activitiesService.getActReviewUserInfo(tripActReviewUserDTO));
			
		}
		
		return resultMap;
	}
	
	@RequestMapping(value="/getReviewList", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getReviewList(@RequestParam int pageNum,
											 @RequestParam("activity_seq") String activity_seq){		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("totalCnt", activitiesService.getReviewContentCnt(activity_seq));
		
		Map<String, Object> activityMap = new HashMap<>();
		activityMap.put("pageNum", pageNum);
		activityMap.put("activity_seq", activity_seq);
		resultMap.put("contentList", activitiesService.getReviewContent(activityMap));
	
		return resultMap;
	}
	
}
