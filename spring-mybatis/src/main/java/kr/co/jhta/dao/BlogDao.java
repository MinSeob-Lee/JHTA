package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Blog;

public interface BlogDao {
	
	List<Blog> getBlogs();
	
	List<Blog> getBlogsByWriter(String writer);

	Blog getBlogByNo(int blogNo);
	
	void insertBlog(Blog blog);
	
	void updateBlog(Blog blog);
	
	void deleteBlogByNo(int blogNo);
	
	void deleteBlogsByWriter(String writer);
}
