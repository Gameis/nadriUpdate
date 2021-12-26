package tripmoment.dao;

import java.util.List;

import area.bean.ImgDTO;
import tripmoment.bean.MainTripmomentDTO;
import tripmoment.bean.TripImgDTO;
import tripmoment.bean.TripViewDTO;
import tripmoment.bean.TripmomentDTO;

public interface TripmomentDAO {
	public void tripmoment_writeForm(ImgDTO imgDTO, String pop_name);

	public void tripmoment_write(TripmomentDTO tripmomentDTO);

	public List<MainTripmomentDTO> onTripmoment();
	
	public List<TripImgDTO> getTripImg(String moment_seq);
	
	public TripViewDTO getTripView(String moment_seq);
	
	public List<MainTripmomentDTO> onReTripmoment(String moment_seq); 
}
