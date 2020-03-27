package com.sample.bookstore.service;

import com.sample.bookstore.vo.Book;
import com.sample.bookstore.vo.Rental;
import com.sample.bookstore.vo.User;

public class BookStoreService {

	BookService bookService = new BookService();
	UserService userService = new UserService();
	RentalService rentalService = new RentalService();

	// 회원등록 서비스
	// 이름, 전화번호를 전달받아서 회원등록 서비스를 제공한다.
	// - UserService의 회원조회기능을 실행해서 회원정보를 제공받는다.
	// - 조회된 회원정보를 화면에 출력한다.
	public void addNewUser(String name, String tel) {
		User user = new User();
		user.name = name;
		user.tel = tel;
		user.point = 100;
		user.isDisabled = false;

		userService.insertUser(user);
	}

	// 회원조회 서비스
	// 회원번호를 전달받아서 회원번호에 대한 회원정보를 화면에 출력한다.
	// - UserService의 회원조회기능을 실행해서 회원정보를 제공받는다.
	// - 조회된 회원정보를 화면에 출력한다.
	public void retrieveUserInfo(int userNo) {
		User user = userService.findUserByNo(userNo);
		
		if (user == null) {
			System.out.println("회원정보가 존재하지 않습니다.");
			return;
		}

		System.out.println("회원번호 : " + user.no);
		System.out.println("이름 : " + user.name);
		System.out.println("전화번호 : " + user.tel);
		System.out.println("포인트 : " + user.point);
		System.out.println("탈퇴여부 : " + user.isDisabled);
	}

	// 회원수정 서비스
	// 수정할 회원정보를 전달받아서 해당 회원의 정보를 수정한다.
	// - UserService의 회원정보 변경기능을 실행해서 회원정보를 수정한다.
	public void modifyUserInfo(User user) {
		userService.updateUser(user);
	}

	// 회원탈퇴 서비스
	// 탈퇴처리할 회원번호를 전달받아서 해당 회원을 탈퇴처리한다.
	// - UserService의 회원조회기능을 실행해서 회원정보를 제공받는다.
	// - 조회된 회원의 탈퇴여부를 탈퇴처리로 변경한다.
	// - RentalService의 반납기능을 실행해서 해당 회원이 대여중인 모든 책을 반납처리한다.
	public void disabledUser(int userNo) {
		User user = userService.findUserByNo(userNo);
		if (user == null) {
			System.out.println("회원정보가 존재하지 않습니다.");
			return;
		}
		
		user.isDisabled = true;
		rentalService.returnAllRentalByUserNo(userNo);
		System.out.println("회원탈퇴가 완료되었습니다.");
	}

	// 전체 회원조회 서비스
	// 등록된 모든 회원정보 조회를 처리한다.
	// - UserService의 모든 회원정보 조회기능을 실행해서 모든 회원정보를 제공받는다.
	// - 조회된 회원정보를 화면에 출력한다.
	public void retrieveAllUsers() {
		User[] users = userService.getAllUsers();

		for (User user : users) {
			if (user == null) {
				break;
			}
			System.out.println();
			System.out.println("===========================================");
			System.out.println("회원번호 : " + user.no);
			System.out.println("이름 : " + user.name);
			System.out.println("전화번호 : " + user.tel);
			System.out.println("포인트 : " + user.point);
			System.out.println("탈퇴여부 : " + user.isDisabled);
		}
	}

	// 도서등록 서비스
	// 제목, 저자, 가격을 전달받아서 도서 등록 서비스를 처리한다.
	// - Book객체를 생성해서 제목, 저자, 가격 정보를 저장한다.
	// - 재고는 10000권으로 한다.
	// - BookService의 도서등록기능을 실행한다.
	public void insertNewBook(String title, String writer, int price) {
		Book book = new Book();
		book.title = title;
		book.writer = writer;
		book.price = price;

		bookService.insertBook(book);
	}

	// 도서 검색 서비스
	// 제목를 전달받아서 도서 검색서비스를 처리한다.
	// - BookService의 도서 검색기능을 실행해서 책정보를 제공받는다.
	// - 조회된 책정보를 화면에 출력한다.
	public void searchBooks(String title) {
		Book[] books = bookService.findBookByTitle(title);

		System.out.println("================================================================");
		System.out.println("제목		번호	가격	작가	재고");
		System.out.println("================================================================");
		for (int i = 0; i < books.length; i++) {
			Book book = books[i];
			System.out.print(book.title + "\t");
			System.out.print(book.no + "\t");
			System.out.print(book.price + "\t");
			System.out.print(book.writer + "\t");
			System.out.print(book.stock);
		}
	}

	// 도서 정보 수정 서비스
	// 책정보를 전달받아서 책정보 수정서비스를 처리한다.
	// - BookService의 책정보 수정기능을 실행한다.
	public void modifyBook(Book book) {
		bookService.updateBook(book);
	}

	// 전체도서 조회 서비스
	// 모든 책정보 조회 서비스를 처리한다.
	// - BookService의 모든 책조회 기능을 실행한다.
	public void retrieveAllBooks() {
		Book[] books = bookService.getAllBooks();

		for(Book book : books) {
			if(book == null) {
				break;
			}
			System.out.println();
			System.out.println("===========================================");
			System.out.println("도서번호 : " + book.no);
			System.out.println("제목 : " + book.title);
			System.out.println("저자 : " + book.writer);
			System.out.println("가격 : " + book.price);
			System.out.println("재고 : " + book.stock);
		}
	}

	// 대여 서비스
	// 사용자번호와 책번호를 전달받아서 대여 서비스를 처리한다.
	// - Rental객체를 생성해서 사용자번호, 책번호를 저장한다.
	// - 대여여부는 대여중으로 설정한다.
	// - 책재고 변경하기
	// - BookService에서 책번호에 해당하는 책정보 조회기능 실행
	// - 조회된 책의 재고를 1감소시킨다.
	public void rentBook(int userNo, int bookNo) {
		
		User user = userService.findUserByNo(userNo);
		Book book = bookService.findBookByNo(bookNo);
		if (user == null) {
			System.out.println("회원정보가 존재하지 않습니다.");
			return;
		}
		if (user.isDisabled) {
			System.out.println("탈퇴처리된 회원입니다.");
			return;
		}
		if (book == null) {
			System.out.println("상품정보가 존재하지 않습니다.");
			return;
		}
		
		Rental rental = new Rental();
		rental.userNo = userNo;
		rental.bookNo = bookNo;
		rental.isRent = true;
		book.stock--;
		rentalService.insertRental(rental);
	}

	// 반납 서비스
	// 대여번호를 전달받아서 반납 서비스를 처리한다.
	// - RentalService에서 대여번호에 해당하는 대여정보 조회 기능을 실행
	// - 조회된 대여정보의 반납여부를 false로 설정한다.
	// - 사용자포인트 증가, 책재고 변경하기
	// - UserService에서 사용자번호로 사용자정보 조회하기 실행
	// - BookService에서 책번호로 책정보 조회하기 실행
	// - 조회된 사용자의 포인트를 책가격의 1%만큼 증가시키기
	// - 조회된 책정보의 재고를 1증가시키기
	public void returnBook(int rentalNo) {
		Rental rentals = rentalService.findRentalByNo(rentalNo);
		rentals.isRent = false;
		User users = userService.findUserByNo(rentals.userNo);
		Book books = bookService.findBookByNo(rentals.bookNo);
		users.point += (int) (books.price * 0.01);
		books.stock++;
	}

	// 대여현황 조회 서비스
	// 모든 대여정보를 조회하는 서비스를 처리한다.
	// - RentalService의 전체 대여정보조회 기능을 실행한다.
	// - 조회된 대여정보를 화면에 출력한다. (null체크)
	public void retrieveAllRentals() {
		Rental[] rentals = rentalService.getAllRentals();
		
		for(Rental rental : rentals) {
			if(rental == null) {
				break;
			}
			System.out.println();
			System.out.println("===========================================");
			System.out.println("대여번호 : " + rental.no);
			System.out.println("회원번호 : " + rental.userNo);
			System.out.println("도서번호 : " + rental.bookNo);
			System.out.println("대여여부 : " + rental.isRent);
			}
		}

	// 회원이름 입력받아서 대여현황 찾기
	/*
	 * public void retrieveRetnalStatus(String userName) { User user =
	 * userService.findUserByName(userName); int userNo = user.no; Rental[] rentals
	 * = rentalService.findRentalByUserNo(userNo);
	 * 
	 * int count = 0; System.out.println(); System.out.println(
	 * "==========================================================");
	 * System.out.println("대여번호	도서번호	도서제목	고객번호	고객이름	대여상태");
	 * System.out.println(
	 * "==========================================================");
	 * while(rentals[count] != null) { Book book =
	 * bookService.findBookByNo(rentals[count].bookNo);
	 * 
	 * System.out.print(rentals[count].no + "\t");
	 * System.out.print(rentals[count].bookNo + "\t"); System.out.print(book.title +
	 * "\t"); System.out.print(rentals[count].userNo + "\t");
	 * System.out.print(userName + "\t"); System.out.print(rentals[count].isRent);
	 * 
	 * count++; if(count == rentals.length) { break; } } }
	 */

	// 회원번호로 대여현황 찾기
	public void retrieveRetnalStatus(int userNo) {
		Rental[] rentals = rentalService.findRentalByUserNo(userNo);

		System.out.println();
		System.out.println("==========================================================");
		System.out.println("도서번호	도서제목	도서가격	대여상태");
		System.out.println("==========================================================");
		
		for(Rental rental : rentals) {
			if(rental == null) {
				break;
			}
			Book book = bookService.findBookByNo(rental.bookNo);

			System.out.print(rental.bookNo + "\t");
			System.out.print(book.title + "\t");
			System.out.print(book.price + "\t");
			System.out.println(rental.isRent);
		}
	}
	
	// 도서번호로 대여현황 찾기
	public void retrieveRetnalBookStatus(int bookNo) {
		Rental[] rentals = rentalService.findRentalByBookNo(bookNo);

		System.out.println();
		System.out.println("==========================================================");
		System.out.println("대여번호	회원번호	회원명");
		System.out.println("==========================================================");
		
		for(Rental rental : rentals) {
			if(rental == null) {
				break;
			}
			User user = userService.findUserByNo(rental.userNo);
			
			System.out.print(rental.no + "\t");
			System.out.print(rental.userNo + "\t");
			System.out.println(user.name);
		}
	}
	
	// 회원번호를 입력받아서 일괄반납 시키기
	public void receiveAllBook(int userNo) {
		
		rentalService.returnAllRentalByUserNo(userNo);
		System.out.println("일괄반납이 완료되었습니다.");
	}
}