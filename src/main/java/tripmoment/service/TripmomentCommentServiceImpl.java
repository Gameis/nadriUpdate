package tripmoment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tripmoment.bean.TripmomentCommentDTO;
import tripmoment.dao.TripmomentCommentDAO;

@Service
public class TripmomentCommentServiceImpl implements TripmomentCommentService {

	@Autowired
	private TripmomentCommentDAO tripmomentCommentDAO;

	@Override
	public List<TripmomentCommentDTO> tripmomentCommentGetList(String moment_seq) {

		return tripmomentCommentDAO.tripmomentCommentGetList(moment_seq);
	}

	@Override
	public void tripmomentCommentWrite(TripmomentCommentDTO tripmomentCommentDTO) {

		tripmomentCommentDAO.tripmomentCommentWrite(tripmomentCommentDTO);

	}

}
