package com.kh.alone.vo;

public class JobTestVo {

	private int tno;
	private String title;
	private String writers;
	private String test_date;
	private String test_time;
	private String images;
	
	public JobTestVo() {
		super();
	}

	public JobTestVo(int tno, String title, String writers, String test_date, String test_time, String images) {
		super();
		this.tno = tno;
		this.title = title;
		this.writers = writers;
		this.test_date = test_date;
		this.test_time = test_time;
		this.images = images;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriters() {
		return writers;
	}

	public void setWriters(String writers) {
		this.writers = writers;
	}

	public String getTest_date() {
		return test_date;
	}

	public void setTest_date(String test_date) {
		this.test_date = test_date;
	}

	public String getTest_time() {
		return test_time;
	}

	public void setTest_time(String test_time) {
		this.test_time = test_time;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	@Override
	public String toString() {
		return "JobTestVo [tno=" + tno + ", title=" + title + ", writers=" + writers + ", test_date=" + test_date
				+ ", test_time=" + test_time + ", images=" + images + "]";
	}
}
