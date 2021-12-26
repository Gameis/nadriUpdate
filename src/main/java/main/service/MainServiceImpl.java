package main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import area.bean.ImgDTO;
import main.bean.TripMainDTO;
import main.bean.TripMainImgDTO;
import main.dao.MainDAO;

@Component
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public void mainWrite(TripMainDTO tripMainDTO) {
		mainDAO.mainWrite(tripMainDTO);
		
	}

	@Override
	public void mainImgWrite(ImgDTO imgDTO) {
		mainDAO.mainImgWrite(imgDTO);
		
	}

	@Override
	public List<TripMainImgDTO> mainImgPrint() {
		return mainDAO.mainImgPrint();
	}

	@Override
	public List<TripMainDTO> mainImgPrint(int main_seq) {
		// TODO Auto-generated method stub
		return null;
	}

}
