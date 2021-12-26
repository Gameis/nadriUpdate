package area.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import area.bean.HotelMainDTO;
import area.bean.ImgDTO;
import area.bean.OnAreaDTO;
import area.bean.PopMainDTO;
import area.bean.TripActivityDTO;
import area.bean.TripHotelDTO;
import area.bean.TripPopDTO;
import area.bean.TripPopMapDTO;
import area.service.AreaService;

@Controller
@RequestMapping(value = "/area")
public class AreaController {
	@Autowired
	private AreaService areaService;

	@RequestMapping(value = "/onArea", method = RequestMethod.GET)
	@ResponseBody
	public List<OnAreaDTO> onArea(@RequestParam("main_seq") String main_seq) {
		return areaService.onArea(main_seq);
	}
	
	@RequestMapping(value = "/popWriteForm", method = RequestMethod.GET)
	public String popWriteForm() {
		return "/repository/jsp/area/popWriteForm";
	}
	
	@RequestMapping(value = "/popWrite", method = RequestMethod.POST)
	@ResponseBody
	public void popWrite(@ModelAttribute TripPopDTO tripPopDTO,
						 @ModelAttribute TripPopMapDTO tripPopMapDTO,
						 @ModelAttribute ImgDTO imgDTO,
						 @RequestParam("main_img") MultipartFile main_img,
						 @RequestParam("img[]") List<MultipartFile> list) {
		

		areaService.popWrite(tripPopDTO, tripPopMapDTO);
		
		
		imgReNameCopy(imgDTO, main_img, "T", "popular", "\\popular\\popmain");
		areaService.imgPopWrite(imgDTO);
		
		for(MultipartFile img : list) {
			imgReNameCopy(imgDTO, img, "F", "popular", "\\popular\\popmain");
			areaService.imgPopWrite(imgDTO);
		}//for
	}
	

	
	@RequestMapping(value="/onAreaPop", method=RequestMethod.GET)
	@ResponseBody
	public List<PopMainDTO> onAreaPop(@RequestParam("main_seq") String main_seq) {
		return areaService.onAreaPop(main_seq);
	}
	
	@RequestMapping(value="/onAreaActivity", method=RequestMethod.GET)
	@ResponseBody
	public List<PopMainDTO> onAreaActivity(@RequestParam("main_seq") String main_seq) {
		return areaService.onAreaActivity(main_seq);
	}
	
	@RequestMapping(value="/popular", method=RequestMethod.GET)
	public String popular() {
		return "/repository/jsp/popular/popular";
	}
	
	@RequestMapping(value="/hotelWriteForm", method=RequestMethod.GET)
	public String hotelWriteForm() {
		return "/repository/jsp/area/hotelWriteForm";
	}
	
	@RequestMapping(value = "/hotelWrite", method = RequestMethod.POST)
	@ResponseBody
	public void hotelWrite(@ModelAttribute TripHotelDTO tripHotelDTO,
						 	  @ModelAttribute ImgDTO imgDTO,
						 	  @RequestParam("main_img") MultipartFile main_img) {
		
		areaService.hotelWrite(tripHotelDTO);
		
		System.out.println("main_seq = " + imgDTO.getMain_seq());
		imgReNameCopy(imgDTO, main_img, "T", "hotel", "\\hotel");
		areaService.imgHotelWrite(imgDTO);
		
	}
	
	@RequestMapping(value = "/onAreaHotel", method = RequestMethod.GET)
	@ResponseBody
	public List<HotelMainDTO> onAreaHotel(@RequestParam("main_seq") String main_seq) {
		return areaService.onAreaHotel(main_seq);
	}
	
	@RequestMapping(value="/activity", method=RequestMethod.GET)
	public String activity() {
		return "/repository/jsp/activities/activities";
	}
	
	@RequestMapping(value = "/activityWriteForm", method = RequestMethod.GET)
	public String activityWriteForm() {
		return "/repository/jsp/area/activityWriteForm";
	}
	
	@RequestMapping(value = "/activityWrite", method = RequestMethod.POST)
	@ResponseBody
	public void activityWrite(@ModelAttribute TripActivityDTO tripActivityDTO,
						 	  @ModelAttribute ImgDTO imgDTO,
						 	  @RequestParam("main_img") MultipartFile main_img,
						 	  @RequestParam("img[]") List<MultipartFile> list) {
		
		areaService.activityWrite(tripActivityDTO);
		
		imgReNameCopy(imgDTO, main_img, "T", "activity", "\\activities");
		areaService.imgActivityWrite(imgDTO);
		
		for(MultipartFile img : list) {
			imgReNameCopy(imgDTO, img, "F", "activity", "\\activities");
			areaService.imgActivityWrite(imgDTO);
		}//for
		
	}
	
	@RequestMapping(value="/search", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> search(@RequestParam("searchText") String searchText) {
		return areaService.search(searchText);
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
	
	//함수
	public void imgReNameCopy(ImgDTO imgDTO, MultipartFile img, String isMain, String img_path, String path) {
		String filePath = "D:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img" + path; //건휘
//		String filePath = "C:\\Users\\downc\\Desktop\\git_home\\nadri\\src\\main\\webapp\\repository\\img" + path; //현석

		
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
}
