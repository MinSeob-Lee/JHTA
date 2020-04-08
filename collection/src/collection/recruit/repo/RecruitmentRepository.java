package collection.recruit.repo;

import java.util.ArrayList;
import java.util.Iterator;

import collection.recruit.vo.Recruitment;

public class RecruitmentRepository {

	private ArrayList<Recruitment> db = new ArrayList<Recruitment>();
	private int sequence = 100;

	// 구직신청 등록하기
	public int addRecruitment(Recruitment recruitment) {
		recruitment.setNo(sequence++);
		db.add(recruitment);
		return recruitment.getNo();
	}

	// 나의 구직신청 현황 조회하기
	public Recruitment getRecruitmentByNo(int recruitmentNo) {
		Recruitment result = null;

		for (Recruitment recruitments : db) {
			if (recruitments.getNo() == recruitmentNo) {
				result = recruitments;
				break;
			}
		}

		return result;
	}

	// 나의 구직신청 삭제하기
	public void deleteRecruitmentByNo(int recruitmentNo) {
		Recruitment recruitment = getRecruitmentByNo(recruitmentNo);
		
		if(recruitment == null) {
			return;
		}
		db.remove(recruitment);
	}

	// 전체 구직현황 조회하기
	public ArrayList<Recruitment> getAllRecruitments() {
		return db;
	}
}
