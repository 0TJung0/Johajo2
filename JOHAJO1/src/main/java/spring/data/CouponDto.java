package spring.data;

import java.sql.Timestamp;

public class CouponDto {
	private int idx;
	private String coupon_name;
	private int discount;
	private int member_f;
	private int event_f;
	private int use;
	private Timestamp startday;
	private Timestamp endday;
	private int add_day;
	
	public int getAdd_day() {
		return add_day;
	}
	public void setAdd_day(int add_day) {
		this.add_day = add_day;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getMember_f() {
		return member_f;
	}
	public void setMember_f(int member_f) {
		this.member_f = member_f;
	}
	public int getEvent_f() {
		return event_f;
	}
	public void setEvent_f(int event_f) {
		this.event_f = event_f;
	}
	public int getUse() {
		return use;
	}
	public void setUse(int use) {
		this.use = use;
	}
	public Timestamp getStartday() {
		return startday;
	}
	public void setStartday(Timestamp startday) {
		this.startday = startday;
	}
	public Timestamp getEndday() {
		return endday;
	}
	public void setEndday(Timestamp endday) {
		this.endday = endday;
	}
	
	
}
