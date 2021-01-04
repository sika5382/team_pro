package com.care.team.board.dto;

import java.sql.Timestamp;

public class BoardDTO {

	private int write_no;
	private String id;
	private String nickname;
	private String place_name;
	private String place_addr;
	private String price;
	private String place_etc;
	private String review;
	private Timestamp savedate;
	private int hit;
	private int idgroup;
	private int step;
	private int indent;
	private String image_file_name;	
	private int rn;
	public int getRn() {return rn;}
	public void setRn(int rn) {this.rn = rn;}
	public int getWrite_no() {
		return write_no;
	}
	public void setWrite_no(int write_no) {
		this.write_no = write_no;
	}
	public Timestamp getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		this.savedate = savedate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getImage_file_name() {
		return image_file_name;
	}
	public void setImage_file_name(String image_file_name) {
		this.image_file_name = image_file_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPlace_addr() {
		return place_addr;
	}
	public void setPlace_addr(String place_addr) {
		this.place_addr = place_addr;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPlace_etc() {
		return place_etc;
	}
	public void setPlace_etc(String place_etc) {
		this.place_etc = place_etc;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getIdgroup() {
		return idgroup;
	}
	public void setIdgroup(int idgroup) {
		this.idgroup = idgroup;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
}
