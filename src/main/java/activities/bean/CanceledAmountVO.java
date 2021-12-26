package activities.bean;

import lombok.Data;

@Data
public class CanceledAmountVO {
	private Integer total, tax_free, vat, point, discount;
}
