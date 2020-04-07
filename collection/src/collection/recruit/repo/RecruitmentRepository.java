package collection.recruit.repo;

import java.util.ArrayList;

import collection.recruit.vo.Recruitment;

public class RecruitmentRepository {

	private ArrayList<Recruitment> db = new ArrayList<Recruitment>();
	private int sequence = 100;
	
	// 구직신청 등록하기
	public void addRecruitment(Recruitment recruitment) {
		
	}
	
	// 나의 구직신청 현황 조회하기
	public Recruitment getRecruitmentByNo(int recruitmentNo) {
		
		return null;
	}
	
	// 나의 구직신청 삭제하기
	public void deleteRecruitmentByNo(int recruitmentNo) {
		
	}
	
	// 전체 구직현황 조회하기
	public ArrayList<Recruitment> getAllRecruitments() {
		return db;
	}
}
