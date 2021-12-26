package tripmoment.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import area.bean.ImgDTO;
import tripmoment.bean.MainTripmomentDTO;
import tripmoment.bean.TripImgDTO;
import tripmoment.bean.TripViewDTO;
import tripmoment.bean.TripmomentDTO;
import tripmoment.service.TripmomentService;

@Controller
@RequestMapping(value = "/tripmoment")
public class TripmomentController {
	
	@Autowired
	private TripmomentService tripmomentService;
	
	@RequestMapping(value = "/tripmoment_writeForm", method = RequestMethod.GET)
	public String tripmoment_writeForm() {	
		return "/repository/jsp/tripmoment/tripmoment_writeForm";
	}
	
	@RequestMapping(value = "/tripmoment_writeForm", method=RequestMethod.POST)
	@ResponseBody
	public void tripmoment_writeForm(
									   @ModelAttribute TripmomentDTO tripmomentDTO,
									   @ModelAttribute ImgDTO imgDTO,
									   @RequestParam("img[]") List<MultipartFile> list) {
		
		System.out.println("member_seq = " + tripmomentDTO.getMember_seq());
		tripmomentService.tripmoment_write(tripmomentDTO);
		
		int count = 0;
		for(MultipartFile img : list) {
			if(count == 0) imgReNameCopy(imgDTO, img, "T", "tripmoment", "\\tripmoment");
			else imgReNameCopy(imgDTO, img, "F", "tripmoment", "\\tripmoment");
			tripmomentService.tripmoment_writeForm(imgDTO, tripmomentDTO.getPop_name());
			count++;
		} //for
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@RequestMapping(value= "/onTripmoment", method=RequestMethod.GET)
	@ResponseBody
	public List<MainTripmomentDTO> onTripmoment() {
		return tripmomentService.onTripmoment();
	}
	
	@RequestMapping(value= "/getTripImg", method=RequestMethod.GET)
	@ResponseBody
	public List<TripImgDTO> getTripImg(@RequestParam("moment_seq") String moment_seq) {
		return tripmomentService.getTripImg(moment_seq);
	}
	
	@RequestMapping(value= "/tripmomentView", method=RequestMethod.GET)
	public String tripmomentView(@RequestParam("moment_seq") String moment_seq) {
		return "/repository/jsp/tripmoment/tripmoment";
	}
	
	@RequestMapping(value="/getTripView", method=RequestMethod.GET)
	@ResponseBody
	public TripViewDTO getTripView(@RequestParam("moment_seq") String moment_seq) {
		return tripmomentService.getTripView(moment_seq);
	}
	
	@RequestMapping(value="/onReTripmoment", method=RequestMethod.GET)
	@ResponseBody
	public List<MainTripmomentDTO> onReTripmoment(@RequestParam("moment_seq") String moment_seq) {
		return tripmomentService.onReTripmoment(moment_seq);
	}
	
		public void imgReNameCopy(ImgDTO imgDTO, MultipartFile img, String isMain, String img_path, String path) {
//			String filePath = "D:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img" + path; //수정
			String filePath = "C:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img" + path;
			//String filePath = "C:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img" + path; //건휘
//			String filePath = "C:\\Users\\downc\\Desktop\\git_home\\nadri\\src\\main\\webapp\\repository\\img" + path; //현석

//			String filePath = "D:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img" + path; //수정
//			String filePath = "C:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img" + path; //건휘
//			String filePath = "C:\\Users\\downc\\Desktop\\git_home\\nadri\\src\\main\\webapp\\repository\\img" + path; //현석
//			String filePath = "D:\\git\\nadri\\src\\main\\webapp\\repository\\img" + path; //병림
						
			String fileName = null;
			File file = null;
			
			fileName = img.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			String newFileName = uuid.toString() + "_" + fileName;
			
			file = new File(filePath, newFileName);
			
			uuid = UUID.randomUUID();
			newFileName = uuid.toString() + "_" + fileName;
			
			file = new File(filePath, newFileName);
			try {
				if(checkImageType(file)) {
					FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
					}else {
						System.out.println("이미지파일이 아닙니다.");
						return;
					}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			imgDTO.setMainImg(isMain);
			imgDTO.setImg_name(newFileName);
			imgDTO.setImg_path(img_path);
		}
	
	/*
	 * @RequestMapping("/tripmoment") public String
	 * tripmoment_write(@Valid @RequestBody TripmomentImgDTO tripmomentImgDTO) {
	 * System.out.println("tripmomentImgDTO.getImage1() = " +
	 * tripmomentImgDTO.getImage1());
	 * System.out.println("tripmomentImgDTO.getImage2() = " +
	 * tripmomentImgDTO.getImage2());
	 * System.out.println("tripmomentImgDTO.getMoment_title() = " +
	 * tripmomentImgDTO.getMoment_title());
	 * System.out.println("tripmomentImgDTO.getMoment_content() = " +
	 * tripmomentImgDTO.getMoment_content());
	 * System.out.println("tripmomentImgDTO.getPop_name() = " +
	 * tripmomentImgDTO.getPop_name());
	 * 
	 * // 비지니스 로직이 들어가는 자리. return "성공!"; }
	 */

}