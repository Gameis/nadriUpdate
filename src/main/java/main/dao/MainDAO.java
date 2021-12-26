package main.dao;

import java.util.List;

import area.bean.ImgDTO;
import main.bean.TripMainDTO;
import main.bean.TripMainImgDTO;

public interface MainDAO {

	public void mainWrite(TripMainDTO tripMainDTO);

	public void mainImgWrite(ImgDTO imgDTO);
	
	public List<TripMainImgDTO> mainImgPrint();

}
