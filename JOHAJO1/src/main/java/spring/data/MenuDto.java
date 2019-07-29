package spring.data;

import org.springframework.web.multipart.MultipartFile;

public class MenuDto {
	private int idx;
	private String fname;
	private int kind;
	private int calorie;
	private String imgname;
	private int count;
	private int price;
	private String origin;
	private int show;
	private MultipartFile upfile;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public int getShow() {
		return show;
	}
	public void setShow(int show) {
		this.show = show;
	}
	public MultipartFile getUpfile() {
		return upfile;
	}
	public void setUpfile(MultipartFile upfile) {
		this.upfile = upfile;
	}
	
	
}