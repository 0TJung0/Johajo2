package spring.data;




import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;



public class CouponDto {
	private int idx;
	private String coupon_name;
	private int discount;
	private String validity;
	private int member_f;
	private int event_f;
	private int use;
	
	
	
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
	public String getValidity() {
		return validity;
	}
	public void setValidity(String validity) {
		this.validity = validity;
	}
	public int getUse() {
		return use;
	}
	public void setUse(int use) {
		this.use = use;
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
	
	
	
	
	
	
	
	
}
