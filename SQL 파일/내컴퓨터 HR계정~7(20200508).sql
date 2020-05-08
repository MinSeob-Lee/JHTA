-- å�� ���� ���䰡 �ۼ��� ������ å ��ȣ�� �ش� ������ �����ϴ� trigger
CREATE OR REPLACE TRIGGER UPDATE_REVIEW_POINT_TRIGGER
    BEFORE
    INSERT ON SAMPLE_BOOK_REVIEWS
    FOR EACH ROW
    
    DECLARE
        v_current_point     NUMBER(2, 1);
        v_current_row_count NUMBER;
        v_temp_point        NUMBER;
        v_point             NUMBER(2, 1);
    
    BEGIN
        SELECT BOOK_POINT INTO v_current_point
        FROM SAMPLE_BOOKS
        WHERE BOOK_NO = :NEW.BOOK_NO;
        
        SELECT COUNT(*) INTO v_current_row_count
        FROM SAMPLE_BOOK_REVIEWS
        WHERE BOOK_NO = :NEW.BOOK_NO;
        
        v_temp_point := (v_current_point * v_current_row_count + :NEW.REVIEW_POINT) / (v_current_row_count + 1);
        v_point := trunc(v_temp_point, 1);
        
        UPDATE SAMPLE_BOOKS
        SET
            BOOK_POINT = v_point
        WHERE
            BOOK_NO = :NEW.BOOK_NO;
        
    END;