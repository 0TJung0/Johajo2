package spring.data;

import java.util.Date;

public class NoticeDto {
	
	private int idx;
	private String topnotice;
	private String title;
	private String contents;
	private String photo;
	private Date writeday;
	private int hide;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTopnotice() {
		return topnotice;
	}
	public void setTopnotice(String topnotice) {
		this.topnotice = topnotice;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getWriteday() {
		return writeday;
	}
	public void setWriteday(Date writeday) {
		this.writeday = writeday;
	}
	public int getHide() {
		return hide;
	}
	public void setHide(int hide) {
		this.hide = hide;
	}
	
	
	
}
