package area.service;

import java.util.List;
import java.util.Map;

import area.bean.HotelMainDTO;
import area.bean.ImgDTO;
import area.bean.OnAreaDTO;
import area.bean.PopMainDTO;
import area.bean.TripActivityDTO;
import area.bean.TripHotelDTO;
import area.bean.TripPopDTO;
import area.bean.TripPopMapDTO;

public interface AreaService {
	public void popWrite(TripPopDTO tripPopDTO, TripPopMapDTO tripPopMapDTO);

	public void imgPopWrite(ImgDTO imgDTO);

	public List<PopMainDTO> onAreaPop(String main_seq);

	public void activityWrite(TripActivityDTO tripActivityDTO);

	public void imgActivityWrite(ImgDTO imgDTO);

	public List<PopMainDTO> onAreaActivity(String main_seq);

	public List<OnAreaDTO> onArea(String main_seq);

	public Map<String, String> search(String searchText);

	public void hotelWrite(TripHotelDTO tripHotelDTO);

	public void imgHotelWrite(ImgDTO imgDTO);

	public List<HotelMainDTO> onAreaHotel(String main_seq);
}
