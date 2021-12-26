package tripmoment.dao;

import java.util.List;

import tripmoment.bean.TripmomentCommentDTO;

public interface TripmomentCommentDAO {

	public List<TripmomentCommentDTO> tripmomentCommentGetList(String moment_seq);

	public void tripmomentCommentWrite(TripmomentCommentDTO tripmomentCommentDTO);

}
