package com.finalp.moim.review.model.vo;

import java.sql.Date;

public class Review implements java.io.Serializable {
	private static final long serialVersionUID = 214L;
	
	private int review_no;
	private int team_num;
	private String team_name;
	private String field_name;
	private String review_title;
	private String review_writer;
	private String review_content;
	private int review_grade;
	private String review_original_filepath;
	private String review_rename_filepath;
	private int review_readcount;
	private java.sql.Date review_date;
	
	public Review() {}

	public Review(int review_no, int team_num, String team_name, String field_name, String review_title,
			String review_writer, String review_content, int review_grade, String review_original_filepath,
			String review_rename_filepath, int review_readcount, Date review_date) {
		super();
		this.review_no = review_no;
		this.team_num = team_num;
		this.team_name = team_name;
		this.field_name = field_name;
		this.review_title = review_title;
		this.review_writer = review_writer;
		this.review_content = review_content;
		this.review_grade = review_grade;
		this.review_original_filepath = review_original_filepath;
		this.review_rename_filepath = review_rename_filepath;
		this.review_readcount = review_readcount;
		this.review_date = review_date;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getTeam_num() {
		return team_num;
	}

	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getField_name() {
		return field_name;
	}

	public void setField_name(String field_name) {
		this.field_name = field_name;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_grade() {
		return review_grade;
	}

	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}

	public String getReview_original_filepath() {
		return review_original_filepath;
	}

	public void setReview_original_filepath(String review_original_filepath) {
		this.review_original_filepath = review_original_filepath;
	}

	public String getReview_rename_filepath() {
		return review_rename_filepath;
	}

	public void setReview_rename_filepath(String review_rename_filepath) {
		this.review_rename_filepath = review_rename_filepath;
	}

	public int getReview_readcount() {
		return review_readcount;
	}

	public void setReview_readcount(int review_readcount) {
		this.review_readcount = review_readcount;
	}

	public java.sql.Date getReview_date() {
		return review_date;
	}

	public void setReview_date(java.sql.Date review_date) {
		this.review_date = review_date;
	}

	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", team_num=" + team_num + ", team_name=" + team_name
				+ ", field_name=" + field_name + ", review_title=" + review_title + ", review_writer=" + review_writer
				+ ", review_content=" + review_content + ", review_grade=" + review_grade
				+ ", review_original_filepath=" + review_original_filepath + ", review_rename_filepath="
				+ review_rename_filepath + ", review_readcount=" + review_readcount + ", review_date=" + review_date
				+ "]";
	}

	
	
}
