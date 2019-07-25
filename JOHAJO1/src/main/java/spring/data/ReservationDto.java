package spring.data;

import java.sql.Date;

public class ReservationDto {
	private int idx;
	private int rem;
	private String resdate;
	private String store;
	private String restime;
	private String restable;
	private String f1;
	private String f2;
	private int fsingle;//단품
	private String coupon;
	private String usepoint;
	private int totalprice;
	private String nm_name;
	private int nm_ph;
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
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	public String getNm_name() {
		return nm_name;
	}
	public void setNm_name(String nm_name) {
		this.nm_name = nm_name;
	}
	public int getNm_ph() {
		return nm_ph;
	}
	public void setNm_ph(int nm_ph) {
		this.nm_ph = nm_ph;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
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
	public String getF1() {
		return f1;
	}
	public void setF1(String f1) {
		this.f1 = f1;
	}
	public String getF2() {
		return f2;
	}
	public void setF2(String f2) {
		this.f2 = f2;
	} 
	public int getFsingle() {
		return fsingle;
	}
	public void setFsingle(int fsingle) {
		this.fsingle = fsingle;
	}
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public String getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(String usepoint) {
		this.usepoint = usepoint;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
	
}
