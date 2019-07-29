package spring.data;

import java.sql.Date;

public class ReservationDto {
	private int idx;
	private int rem;
	private String resdate;
	private int store;
	private String restime;
	private String restable;
	private int fsingle;//단품
	private int coupon;
	private int usepoint;
	private int totalprice;
	private String nm_ph;
	private String nm_pass;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRem() {
		return rem;
	}
	public void setRem(int rem) {
		this.rem = rem;
	}
	public String month() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	public String getNm_pass() {
		return nm_pass;
	}
	public void setNm_pass(String nm_pass) {
		this.nm_pass = nm_pass;
	}
	public String getNm_ph() {
		return nm_ph;
	}
	public void setNm_ph(String nm_ph) {
		this.nm_ph = nm_ph;
	}
	public int getStore() {
		return store;
	}
	public void setStore(int store) {
		this.store = store;
	}
	public String getRestime() {
		return restime;
	}
	public void setRestime(String restime) {
		this.restime = restime;
	}
	public String getRestable() {
		return restable;
	}
	public void setRestable(String restable) {
		this.restable = restable;
	}
	public String getResdate() {
		return resdate;
	}
	public int getFsingle() {
		return fsingle;
	}
	public void setFsingle(int fsingle) {
		this.fsingle = fsingle;
	}
	public int getCoupon() {
		return coupon;
	}
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
	
	
}
