package tripmoment.service;

import java.util.List;

import tripmoment.bean.TripmomentCommentDTO;

public interface TripmomentCommentService {
	

	public List<TripmomentCommentDTO> tripmomentCommentGetList(String moment_seq);

	public void tripmomentCommentWrite(TripmomentCommentDTO tripmomentCommentDTO);

}
