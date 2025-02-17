package dto;

import java.sql.Timestamp;

public class MembersDTO {
	private String m_id;
	private String pw;
	private String name;
	private String nickname;
	private String email;
	private String phone;
	private String sexual;
	private String postcode;
	private String address1;
	private String address2;
	private Timestamp signup_date;
	private int warning_count;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSexual() {
		return sexual;
	}
	public void setSexual(String sexual) {
		this.sexual = sexual;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Timestamp getSignup_date() {
		return signup_date;
	}
	public void setSignup_date(Timestamp signup_date) {
		this.signup_date = signup_date;
	}
	public int getWarning_count() {
		return warning_count;
	}
	public void setWarning_count(int warning_count) {
		this.warning_count = warning_count;
	}
	public MembersDTO(String m_id, String pw, String name, String nickname, String email, String phone, String sexual,
			String postcode, String address1, String address2, Timestamp signup_date, int warning_count) {
		this.m_id = m_id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.sexual = sexual;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
		this.signup_date = signup_date;
		this.warning_count = warning_count;
	}
	
	
	
}
