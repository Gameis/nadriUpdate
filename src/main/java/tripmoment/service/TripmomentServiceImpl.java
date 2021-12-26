package tripmoment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import area.bean.ImgDTO;
import tripmoment.bean.MainTripmomentDTO;
import tripmoment.bean.TripImgDTO;
import tripmoment.bean.TripViewDTO;
import tripmoment.bean.TripmomentDTO;
import tripmoment.dao.TripmomentDAO;

@Component
public class TripmomentServiceImpl implements TripmomentService {
	
	@Autowired
	private TripmomentDAO tripmomentDAO;

	@Override
	public void tripmoment_writeForm(ImgDTO imgDTO, String pop_name) {
		tripmomentDAO.tripmoment_writeForm(imgDTO, pop_name);	
	}

	@Override
	public void tripmoment_write(TripmomentDTO tripmomentDTO) {
		tripmomentDAO.tripmoment_write(tripmomentDTO);	
	}

	@Override
	public List<MainTripmomentDTO> onTripmoment() {
		return tripmomentDAO.onTripmoment();
	}

	@Override
	public List<TripImgDTO> getTripImg(String moment_seq) {
		return tripmomentDAO.getTripImg(moment_seq);
	}

	@Override
	public TripViewDTO getTripView(String moment_seq) {
		return tripmomentDAO.getTripView(moment_seq);
	}

	@Override
	public List<MainTripmomentDTO> onReTripmoment(String moment_seq) {
		return tripmomentDAO.onReTripmoment(moment_seq);
	}
}
