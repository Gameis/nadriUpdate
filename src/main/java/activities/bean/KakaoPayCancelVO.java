package activities.bean;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayCancelVO {

	// response
	private String tid, aid, cid, status;
	private String partner_order_id, partner_user_id, payment_method_type;
	private String item_name, item_code, payload;
	private AmountVO amount;
	private ApprovedCancelAmountVO approved_cancel_amount;
	private CanceledAmountVO canceled_amount;
	private CancelAvailableAmountVO cancel_available_amount;
	private Integer quantity;
	private Date created_at, approved_at, canceled_at;
}
