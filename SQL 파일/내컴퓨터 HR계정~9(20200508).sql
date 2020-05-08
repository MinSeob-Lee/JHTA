CREATE OR REPLACE FUNCTION GET_TOTAL_ORDER_AMOUNT
(i_book_id IN NUMBER)
RETURN NUMBER

IS

v_total_amount      number := 0;

BEGIN

    SELECT SUM(ORDER_AMOUNT)
    INTO v_total_amount
    FROM SAMPLE_BOOK_ORDERS
    WHERE BOOK_NO = i_book_id;
    
    RETURN v_total_amount;

END;