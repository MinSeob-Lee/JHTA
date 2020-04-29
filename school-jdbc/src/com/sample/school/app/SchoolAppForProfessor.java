package com.sample.school.app;

import com.sample.school.util.KeyboardUtil;

public class SchoolAppForProfessor {

	public static void main(String[] args) throws Exception {

		while (true) {
			System.out.println("학사관리 프로그램(교수용)");
			System.out.println("--------------------------------------------------------------");
			System.out.println("1.과목조회  2.과목등록  3.과정목록조회  4.과정상세조회  5.과정등록  0.종료");
			System.out.println("--------------------------------------------------------------");
			System.out.print("원하시는 항목을 선택해주세요 : ");
			int menuNo = KeyboardUtil.nextInt();

			if (menuNo == 1) {
				System.out.println("[과목조회]");

			} else if (menuNo == 2) {
				System.out.println("[과목등록]");

			} else if (menuNo == 3) {
				System.out.println("[과정목록조회]");

			} else if (menuNo == 4) {
				System.out.println("[과정상세조회]");

			} else if (menuNo == 5) {
				System.out.println("[과정등록]");

			} else if (menuNo == 0) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}
		}
	}
}
