package collection.recruit;

import java.util.Scanner;

import collection.recruit.service.RecruitmentService;
import collection.recruit.vo.Career;
import collection.recruit.vo.Recruitment;
import collection.recruit.vo.Resume;

public class RecruitApp {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		RecruitmentService service = new RecruitmentService();

		while (true) {
			System.out.println("=========================================");
			System.out.println("1.구직자  2.인사담당자  0.종료");
			System.out.println("=========================================");

			System.out.print("메뉴를 선택하세요: ");
			int menuNo = scanner.nextInt();

			if (menuNo == 1) {
				System.out.println(
						"=========================================================================================");
				System.out.println("1.이력서등록 2.경력사항등록 3.채용상태확인 4.이력서수정 5.구직신청 삭제 6.경력사항 수정 7.구직신청 현황 조회");
				System.out.println(
						"=========================================================================================");

				System.out.print("구직자 메뉴를 선택하세요 : ");
				int empMenuNo = scanner.nextInt();

				if (empMenuNo == 1) {
					// 이름, 전화번호, 지원부서를 입력받는다.
					System.out.println("[이력서 등록]");
					System.out.print("이름을 입력해주세요 : ");
					String name = scanner.next();
					System.out.print("전화번호를 입력해주세요 : ");
					String tel = scanner.next();
					System.out.print("지원부서를 입력해주세요 : ");
					String dept = scanner.next();

					Resume resume = new Resume();
					resume.setName(name);
					resume.setTel(tel);
					resume.setDept(dept);

					service.addNewResume(resume);
				} else if (empMenuNo == 2) {
					// 구직신청번호, 재직회사명, 근무부서, 직위, 근무년수를 입력받는다.
					System.out.println("[경력 사항 등록]");
					System.out.print("구직신청번호를 입력해주세요 : ");
					int recruitmentNo = scanner.nextInt();
					System.out.print("재직회사명을 입력해주세요 : ");
					String companyName = scanner.next();
					System.out.print("근무부서를 입력해주세요 : ");
					String dept = scanner.next();
					System.out.print("직위를 입력해주세요 : ");
					String position = scanner.next();
					System.out.print("근무년수를 입력해주세요 : ");
					int year = scanner.nextInt();

					Career career = new Career();
					career.setCompanyName(companyName);
					career.setDept(dept);
					career.setPosition(position);
					career.setYear(year);

					service.addCareer(recruitmentNo, career);
				} else if (empMenuNo == 3) {
					// 구직신청번호를 입력받는다.
					System.out.println("[채용 상태 확인]");
					System.out.print("구직신청번호를 입력해주세요 : ");
					int recruitmentNo = scanner.nextInt();

					service.printRecruitmentDetail(recruitmentNo);
				} else if (empMenuNo == 4) {
					// 구직신청번호, 이름, 전화번호, 지원부서를 입력받는다.
					System.out.println("[이력서 수정]");
					System.out.print("구직신청번호를 입력해주세요 : ");
					int recruitmentNo = scanner.nextInt();
					System.out.print("이름을 입력해주세요 : ");
					String name = scanner.next();
					System.out.print("전화번호를 입력해주세요 : ");
					String tel = scanner.next();
					System.out.print("지원부서를 입력해주세요 : ");
					String dept = scanner.next();

					Resume resume = new Resume();
					resume.setName(name);
					resume.setTel(tel);
					resume.setDept(dept);

					service.updateResume(recruitmentNo, resume);
				} else if (empMenuNo == 5) {
					// 구직신청번호를 입력받는다.
					System.out.println("[구직신청 삭제]");
					System.out.print("구직신청번호를 입력해주세요 : ");
					int recruitmentNo = scanner.nextInt();

					service.deleteRecruitment(recruitmentNo);
				} else if (empMenuNo == 6) {
					System.out.println("[경력사항 수정]");
					System.out.println("====================================");
					System.out.println("1.경력사항 수정   2.경력사항 삭제");
					System.out.println("====================================");
					System.out.print("경력사항 수정 메뉴를 선택하세요 : ");
					int careerMenuNo = scanner.nextInt();

					if (careerMenuNo == 1) {
						System.out.println("[경력사항 수정]");
						System.out.print("구직신청번호를 입력해주세요 : ");
						int recruitmentNo = scanner.nextInt();
						System.out.print("재직회사명을 입력해주세요 : ");
						String companyName = scanner.next();
						System.out.print("수정할 근무부서를 입력해주세요 : ");
						String dept = scanner.next();
						System.out.print("수정할 직위를 입력해주세요 : ");
						String position = scanner.next();
						System.out.print("수정할 근무년수를 입력해주세요 : ");
						int year = scanner.nextInt();

						Career career = new Career();
						career.setDept(dept);
						career.setPosition(position);
						career.setYear(year);

						service.updateCareer(recruitmentNo, companyName, career);
					} else if (careerMenuNo == 2) {
						System.out.println("[경력사항 삭제]");
						System.out.print("구직신청번호를 입력해주세요 : ");
						int recruitmentNo = scanner.nextInt();
						System.out.print("재직회사명을 입력해주세요 : ");
						String companyName = scanner.next();

						service.deleteCareer(recruitmentNo, companyName);
					}
				} else if (empMenuNo == 7) {
					System.out.println("[구직신청 현황 조회]");
					System.out.println("============================================================");
					System.out.println("1.지원자수 조회   2.중복 지원자수 조회   3.중복 지원자 평균 근무기간 조회");
					System.out.println("============================================================");
					System.out.print("구직신청 현황 조회 메뉴를 선택하세요 : ");
					int recruitmentStatusNo = scanner.nextInt();

					if (recruitmentStatusNo == 1) {
						System.out.println("[지원자수 조회]");

						service.findRecruitmentNumber();
					} else if (recruitmentStatusNo == 2) {
						System.out.println("[중복 지원자수 조회]");
						System.out.print("구직신청번호를 입력해주세요 : ");
						int recruitmentNo = scanner.nextInt();

						service.findRecruitmentDeptNumber(recruitmentNo);
					} else if (recruitmentStatusNo == 3) {
						System.out.println("[중복 지원자 평균 근무기간 조회]");
						System.out.print("구직신청번호를 입력해주세요 : ");
						int recruitmentNo = scanner.nextInt();

						service.findRecruitmentAvgYear(recruitmentNo);
					}
				}

			} else if (menuNo == 2) {
				System.out.println("==========================================================================");
				System.out.println("1.채용신청서 조회  2.채용신청서 상세조회  3.채용신청서 심사  4.전체 구직신청조회  0.종료");
				System.out.println("==========================================================================");

				System.out.print("구직자 메뉴를 선택하세요 : ");
				int empMenuNo = scanner.nextInt();

				if (empMenuNo == 1) {
					// 입력값 없음
					System.out.println("[채용신청서 조회]");

					service.printAllRecruitment();
				} else if (empMenuNo == 2) {
					// 구직신청번호를 입력받는다.
					System.out.println("[채용신청서 상세조회]");
					System.out.print("구직신청번호를 입력해주세요 : ");
					int recruitmentNo = scanner.nextInt();

					service.printRecruitmentDetail(recruitmentNo);
				} else if (empMenuNo == 3) {
					// 구직신청번호와 합격불합격여부를 Y/N으로 입력받는다.
					System.out.println("[채용신청서 심사]");
					System.out.print("구직신청번호를 입력해주세요 : ");
					int recruitmentNo = scanner.nextInt();
					System.out.print("합격/불합격 여부를 입력해주세요(Y/N) : ");
					String passed = scanner.next();

					boolean isPassed = false;
					if (passed.equals("Y")) {
						isPassed = true;
					}

					service.checkRecruitment(recruitmentNo, isPassed);
				} else if (empMenuNo == 4) {
					System.out.println("[전체 구직신청 조회]");
					System.out.println("=================================");
					System.out.println("1.이름순 정렬   2.근무경력순 정렬");
					System.out.println("=================================");
					System.out.print("정렬 메뉴를 선택하세요 : ");
					int sortMenu = scanner.nextInt();

					if (sortMenu == 1) {
						System.out.println("[이름순 정렬]");

						service.printAllRecruitmentSortedByName();
					} else if (sortMenu == 2) {
						System.out.println("[근무경력순 정렬]");

						service.printAllRecruitmentSortedByYear();
					}
				} else if (menuNo == 0) {
					System.out.println("### 프로그램을 종료합니다.");
					break;
				}
			}
		}
		scanner.close();
	}
}