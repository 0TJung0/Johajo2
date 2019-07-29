package spring.data;

import java.sql.Date;

public class EventDto {
	
	private int idx;
	private String title;
	private String con;
	private String title_img;
	private String main_img;
	private Date writedate;
	private Date startday;
	private Date endday;
	private int count;
	private int discount_rate;
	private int validity_month;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public String getTitle_img() {
		return title_img;
	}
	public void setTitle_img(String title_img) {
		this.title_img = title_img;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public Date getStartday() {
		return startday;
	}
	public void setStartday(Date startday) {
		this.startday = startday;
	}
	public Date getEndday() {
		return endday;
	}
	public void setEndday(Date endday) {
		this.endday = endday;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(int discount_rate) {
		this.discount_rate = discount_rate;
	}
	public int getValidity_month() {
		return validity_month;
	}
	public void setValidity_month(int validity_month) {
		this.validity_month = validity_month;
	}
}
