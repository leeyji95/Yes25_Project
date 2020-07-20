package com.lec.yes25.logistics;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class LogisticsDTO {
	private int order_uid; // order_uid
	private int book_uid; // book_uid
	private int account_uid; // account_uid
	private int order_unit_cost; // order_unit_cost
	private int order_quantity; // order_quantity
	private Timestamp order_date; // order_date
	private int order_state; // order_state
	
	
	public String getOrder_date(){
		return new SimpleDateFormat("yyyy-MM-dd").format(order_date);
	}
}
