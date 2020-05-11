CREATE OR REPLACE PROCEDURE ADD_BOOK_ORDER
(i_user_id IN sample_book_users.user_id%type,
 i_book_no IN sample_books.book_no%type,
 i_order_amount IN sample_book_orders.order_amount%type)

IS
    v_order_price sample_books.book_discount_price%type;
    v_stock       sample_books.book_stock%type;
    
    BOOK_APPLICATION_ERROR EXCEPTION;
    
BEGIN

    SELECT BOOK_DISCOUNT_PRICE, BOOK_STOCK
    INTO v_order_price, v_stock
    FROM SAMPLE_BOOKS
    WHERE BOOK_NO = i_book_no;
    
    IF i_order_amount <= v_stock THEN
    INSERT INTO SAMPLE_BOOK_ORDERS
    (ORDER_NO, USER_ID, BOOK_NO, ORDER_PRICE, ORDER_AMOUNT, ORDER_REGISTERED_DATE)
    VALUES (SAMPLE_ORDER_SEQ.NEXTVAL, i_user_id, i_book_no, v_order_price, i_order_amount, sysdate);
     
    UPDATE SAMPLE_BOOKs SET BOOK_STOCK = v_stock - i_order_amount
    WHERE BOOK_NO = i_book_no;
    
    COMMIT;
    
    ELSE
        -- 책의 재고가 주문량보다 부족한 경우 예외 발생
        RAISE BOOK_APPLICATION_ERROR;
    END IF;
    
    -- 예외철
    EXCEPTION
    -- 사용자 정의가 예외가 발생했다면 오라클의 RAISE_APPLICATION_ERROR(에러코드, 에러메시지)를 실행시킨다.
        WHEN BOOK_APPLICATION_ERROR THEN
        -- 오류코드는 -20000, -29999 사이의 값을 사용한다.
            RAISE_APPLICATION_ERROR(-100000, '재고가 부족합니다.');
END;