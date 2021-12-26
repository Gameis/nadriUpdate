package area.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import area.bean.HotelMainDTO;
import area.bean.ImgDTO;
import area.bean.OnAreaDTO;
import area.bean.PopMainDTO;
import area.bean.TripActivityDTO;
import area.bean.TripHotelDTO;
import area.bean.TripPopDTO;
import area.bean.TripPopMapDTO;
import area.dao.AreaDAO;

@Component
public class AreaServiceImpl implements AreaService {

	@Autowired
	private AreaDAO areaDAO;
	
	@Override
	public void popWrite(TripPopDTO tripPopDTO, 
						 TripPopMapDTO tripPopMapDTO) {
		
		areaDAO.popWrite(tripPopDTO, tripPopMapDTO);
		
	}
	
	@Override
	public void activityWrite(TripActivityDTO tripActivityDTO) {
		areaDAO.activityWrite(tripActivityDTO);
		
	}

	@Override
	public void imgPopWrite(ImgDTO imgDTO) {
		areaDAO.imgPopWrite(imgDTO);
	}
	
	@Override
	public void imgActivityWrite(ImgDTO imgDTO) {
		areaDAO.imgActivityWrite(imgDTO);
	}

	@Override
	public List<PopMainDTO> onAreaPop(String main_seq) {
		return areaDAO.printPopMain(main_seq);
	}

	@Override
	public List<PopMainDTO> onAreaActivity(String main_seq) {
		return areaDAO.printActivityMain(main_seq);
	}

	@Override
	public List<OnAreaDTO> onArea(String main_seq) {
		return areaDAO.onArea(main_seq);
		
	}
	
	@Override
	public Map<String, String> search(String searchText) {
		return areaDAO.search(searchText);
	}

	@Override
	public void hotelWrite(TripHotelDTO tripHotelDTO) {
		areaDAO.hotelWrite(tripHotelDTO);
		
	}

	@Override
	public void imgHotelWrite(ImgDTO imgDTO) {
		areaDAO.imgHotelWrite(imgDTO);
	}

	@Override
	public List<HotelMainDTO> onAreaHotel(String main_seq) {
		return areaDAO.onAreaHotel(main_seq);
	}



}

