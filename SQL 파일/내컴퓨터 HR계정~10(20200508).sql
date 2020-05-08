CREATE OR REPLACE FUNCTION GET_TOTAL_ORDER_PRICE
(i_book_no IN NUMBER)
RETURN NUMBER

IS

v_total_price  number := 0;
v_book_price  number := 0;
v_order_amount  number := 0;

BEGIN

SELECT BOOK_DISCOUNT_PRICE
INTO v_book_price
FROM SAMPLE_BOOKS
WHERE BOOK_NO = i_book_no;

SELECT SUM(ORDER_AMOUNT)
INTO v_order_amount
FROM SAMPLE_BOOK_ORDERS
WHERE BOOK_NO = i_book_no;

v_total_price := v_book_price * v_order_amount;

RETURN v_total_price;

END;