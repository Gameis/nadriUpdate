package main.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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
import main.bean.TripMainDTO;
import main.bean.TripMainImgDTO;
import main.service.MainService;

@Controller
@RequestMapping(value = "/main")
public class MainController {

	@Autowired
	private MainService mainService;

	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.POST)
	@ResponseBody
	public void kakaoLogin(@RequestParam("memId") String memId, HttpSession session) {
		session.setAttribute("member_seq", "0");
		session.setAttribute("memId", memId);
		session.setAttribute("memName", "guest");
	}

	@RequestMapping(value = "/area", method = RequestMethod.GET)
	public String area() {
		return "/repository/jsp/area/area";
	}

	@RequestMapping(value = "/mainWriteForm", method = RequestMethod.GET)
	public String mainWriteForm() {
		return "/repository/jsp/main/mainWriteForm";
	}

	@RequestMapping(value = "/mainWrite", method = RequestMethod.POST)
	@ResponseBody
	public void mainWrite(@ModelAttribute TripMainDTO tripMainDTO, @ModelAttribute ImgDTO imgDTO, @RequestParam("main_img") MultipartFile main_img, @RequestParam("areaMain_img") MultipartFile areaMain_img, @RequestParam("img[]") List<MultipartFile> list, @RequestParam("map") MultipartFile map) {

		mainService.mainWrite(tripMainDTO);

		imgReNameCopy(imgDTO, main_img, "T", "main", "\\main");
		mainService.mainImgWrite(imgDTO);

		imgReNameCopy(imgDTO, areaMain_img, "T", "area", "\\area");
		imgDTO.setContent_seq(2);
		mainService.mainImgWrite(imgDTO);

		imgReNameCopy(imgDTO, map, "M", "area", "\\area");
		mainService.mainImgWrite(imgDTO);

		for (MultipartFile img : list) {
			imgReNameCopy(imgDTO, img, "F", "area", "\\area");
			mainService.mainImgWrite(imgDTO);
		} // for
	}

	@RequestMapping(value = "/mainImgPrint", method = RequestMethod.GET)
	@ResponseBody
	public List<TripMainImgDTO> mainImgPrint() {
		return mainService.mainImgPrint();
	}

	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	public void imgReNameCopy(ImgDTO imgDTO, MultipartFile img, String isMain, String img_path, String path) {
		// String filePath =
		// "D:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img" + path;
		// //수정
		String filePath = "C:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img" + path;
		// String filePath =
		// "C:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img" + path;
		// //건휘
		// String filePath =
		// "C:\\Users\\downc\\Desktop\\git_home\\nadri\\src\\main\\webapp\\repository\\img"
		// + path; //현석

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
			if (checkImageType(file)) {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} else {
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
