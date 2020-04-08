package collection.recruit.service;

import java.util.ArrayList;

import collection.recruit.repo.RecruitmentRepository;
import collection.recruit.vo.Career;
import collection.recruit.vo.Recruitment;
import collection.recruit.vo.Resume;

public class RecruitmentService {

	private RecruitmentRepository repo = new RecruitmentRepository();

	// 이력서 등록기능
	public void addNewResume(Resume resume) {
		// 구직신청객체 생성
		// 구직신청객체에 전달받은 이력서 객체 저장
		// 레포지토리객체를 사용해서 db에 저장하고, 자신의 구직신청번호를 반환받는다.
		// 구직신청번호를 출력한다.
		Recruitment recruitment = new Recruitment();
		recruitment.setResume(resume);

		int recruitNo = repo.addRecruitment(recruitment);
		System.out.println("등록된 구직신청번호는 " + recruitNo + "번입니다.");
	}

	// 경력사항 등록기능
	public void addCareer(int recruitmentNo, Career career) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회한다.
		// 구직신청객체의 경력사항에 전달받은 경력사항객체를 추가한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		
		if(recruitment == null) {
			return;
		}
		
		recruitment.addCareer(career);
	}

	// 구직신청 상태 조회 기능
	public void printRecruitmentDetail(int recruitmentNo) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회해서 화면에 출력한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);

		if (recruitment == null) {
			return;
		}

		Resume resume = recruitment.getResume();
		System.out.println("이    름 : " + resume.getName());
		System.out.println("전화번호 : " + resume.getTel());
		System.out.println("희망부서 : " + resume.getDept());
		
		ArrayList<Career> careers = recruitment.getCareers();
		for(Career career : careers) {
			System.out.println("회 사 명 : " + career.getCompanyName());
			System.out.println("부 서 명 : " + career.getDept());
			System.out.println("직    급 : " + career.getPosition());
			System.out.println("근무연수 : " + career.getYear());
		}
		System.out.println("경력정보 조회 완료");
		
		String passed = "";
		
		if(recruitment.isPassed()) {
			passed = "합격";
		} else {
			passed = "불합격";
		}
		
		System.out.println("합격여부 : " + passed);
		
	}

	// 이력서 수정 기능
	public void updateResume(int recruitmentNo, Resume resume) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회한다.
		// 구직신청객체의 이력서정보를 전달받은 이력서 정보로 교체한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		recruitment.setResume(resume);	
	}

	// 구직신청 삭제하기
	public void deleteRecruitment(int recruitmentNo) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 삭제한다.
		repo.deleteRecruitmentByNo(recruitmentNo);
	}

	// 전체 구직신청정보 간단 조회
	public void printAllRecruitment() {
		// 레포지토리에서 모든 구직신청 정보를 조회해서 화면에 출력한다.
		ArrayList<Recruitment> recruitments = repo.getAllRecruitments();
		System.out.println("-------------------------------------------------");
		System.out.println("구직신청번호\t이름\t경력여부\t합격여부");
		System.out.println("-------------------------------------------------");
		for(Recruitment recruit : recruitments) {
			Resume resume = recruit.getResume();
			String isCareer = "";
			if (recruit.getCareers().isEmpty()) {
				isCareer = "없음";
			} else {
				isCareer = "있음";
			}
			System.out.print(recruit.getNo() + "\t");
			System.out.print(resume.getName()+ "\t");
			System.out.print(isCareer + "\t");
			System.out.println(recruit.isPassed());
		}
	}

	// 구직신청 심사하기
	public void checkRecruitment(int recruitmentNo, boolean passed) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회한다.
		// 합격/불합격여부를 결정한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		recruitment.setPassed(passed);
		
		String pass = "";
		
		if(recruitment.isPassed()) {
			pass = "합격";
		} else {
			pass = "불합격";
		}
		
		System.out.println("합격여부 : " + pass);
	}
}