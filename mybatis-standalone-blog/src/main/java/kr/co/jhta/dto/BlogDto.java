package kr.co.jhta.dto;

import java.util.Date;

import kr.co.jhta.vo.Blog;

public class BlogDto {

	private int no;
	private String writer;
	private String content;
	private Blog blogNo;
	private Date createdDate;
	private String id;
	private String name;
	private String password;
	private String email;
	private Date userCreatedDate;
	
	public BlogDto() {}

	public BlogDto(int no, String writer, String content, Blog blogNo, Date createdDate, String id, String name,
			String password, String email, Date userCreatedDate) {
		super();
		this.no = no;
		this.writer = writer;
		this.content = content;
		this.blogNo = blogNo;
		this.createdDate = createdDate;
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.userCreatedDate = userCreatedDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Blog getBlogNo() {
		return blogNo;
	}

	public void setBlogNo(Blog blogNo) {
		this.blogNo = blogNo;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getUserCreatedDate() {
		return userCreatedDate;
	}

	public void setUserCreatedDate(Date userCreatedDate) {
		this.userCreatedDate = userCreatedDate;
	}
}
