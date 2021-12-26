package tripmoment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tripmoment.bean.TripmomentCommentDTO;
import tripmoment.service.TripmomentCommentService;

@Controller
@RequestMapping(value= "/tripmoment")
public class tripmomentCommentController {
	@Autowired
	TripmomentCommentService tripmomentCommentService;
	
	
	@PostMapping("/tripmomentCommentWrite")
	@ResponseBody
	public void tripmomentCommentWrite(@ModelAttribute TripmomentCommentDTO tripmomentCommentDTO
			, HttpSession session
			, HttpServletRequest request) {
		
		tripmomentCommentService.tripmomentCommentWrite(tripmomentCommentDTO);
	}
	
	@GetMapping("/tripmomentCommentGetList")
	@ResponseBody
	public List<TripmomentCommentDTO> tripmomentCommentGetList(@RequestParam String moment_seq){
		
		return tripmomentCommentService.tripmomentCommentGetList(moment_seq);
		
	}
	

}
