package com.ottt.ottt.dto;

import java.util.Objects;

/*알림
 * 	noti_no				bigint	generated always as identity primary key
	, user_no			bigint	not null
	, target_user_no	bigint	not null
	, review_no			bigint
	, article_no		bigint
	, cmt_no			bigint
	, message_no		bigint
	, noti_check		boolean	default false
	, noti_url			text	not null
	, noti_message		varchar	not null
 */

public class NotificationDTO {
	
	private	Integer	noti_no;
	private Integer	user_no;
	private Integer	target_user_no;
	private Integer review_no;
	private Integer article_no;
	private Integer cmt_no;
	private Integer message_no;
	private boolean	noti_check;
	private String	noti_url;
	private String	noti_message;
	
	private String image;
	private String user_nicknm;
	
	
	public NotificationDTO() {}


	public Integer getNoti_no() {
		return noti_no;
	}

	public void setNoti_no(Integer noti_no) {
		this.noti_no = noti_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}

	public int getTarget_user_no() {
		return target_user_no;
	}

	public void setTarget_user_no(Integer target_user_no) {
		this.target_user_no = target_user_no;
	}

	public Integer getReview_no() {
		return review_no;
	}

	public void setReview_no(Integer review_no) {
		this.review_no = review_no;
	}

	public Integer getArticle_no() {
		return article_no;
	}

	public void setArticle_no(Integer article_no) {
		this.article_no = article_no;
	}

	public Integer getCmt_no() {
		return cmt_no;
	}

	public void setCmt_no(Integer cmt_no) {
		this.cmt_no = cmt_no;
	}

	public Integer getMessage_no() {
		return message_no;
	}

	public void setMessage_no(Integer message_no) {
		this.message_no = message_no;
	}

	public boolean isNoti_check() {
		return noti_check;
	}

	public void setNoti_check(boolean noti_check) {
		this.noti_check = noti_check;
	}

	public String getNoti_url() {
		return noti_url;
	}

	public void setNoti_url(String noti_url) {
		this.noti_url = noti_url;
	}

	public String getNoti_message() {
		return noti_message;
	}

	public void setNoti_message(String noti_message) {
		this.noti_message = noti_message;
	}
	
	
	// 알림 확인 여부 O로 바꾸기(상태 변경)
	public void noti_check() {
		this.setNoti_check(true);
	}


	@Override
	public int hashCode() {
		return Objects.hash(article_no, cmt_no, message_no, noti_check, noti_message, noti_no, noti_url, review_no,
				target_user_no, user_no);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NotificationDTO other = (NotificationDTO) obj;
		return Objects.equals(article_no, other.article_no) && Objects.equals(cmt_no, other.cmt_no)
				&& Objects.equals(message_no, other.message_no) && noti_check == other.noti_check
				&& Objects.equals(noti_message, other.noti_message) && Objects.equals(noti_no, other.noti_no)
				&& Objects.equals(noti_url, other.noti_url) && Objects.equals(review_no, other.review_no)
				&& target_user_no == other.target_user_no && user_no == other.user_no;
	}


	@Override
	public String toString() {
		return "NotificationDTO [noti_no=" + noti_no + ", user_no=" + user_no + ", target_user_no=" + target_user_no
				+ ", review_no=" + review_no + ", article_no=" + article_no + ", cmt_no=" + cmt_no + ", message_no="
				+ message_no + ", noti_check=" + noti_check + ", noti_url=" + noti_url + ", noti_message="
				+ noti_message + "]";
	}

}
