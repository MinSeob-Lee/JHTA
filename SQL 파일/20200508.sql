-- ������ȣ�� �λ���� ���޹޾Ƽ� �� ������ �޿��� �λ��Ű�� ���ν��� �ۼ��ϱ�
CREATE OR REPLACE PROCEDURE UPDATE_SALARY
(i_emp_id IN NUMBER)
IS
    -- ���� �����Ѵ�.
    -- ����       ������ ������ Ÿ��
    --           EMPLOYEES�� SALARY �÷��� ������ Ÿ�԰� ������ ������ Ÿ������ ���� ����
    v_emp_salary EMPLOYEES.SALARY%TYPE; -- ����� �޿�
    v_update_rate NUMBER(3, 2);         -- �޿� �λ��
    
BEGIN
    -- SQL ����, PL/SQL ������ �ۼ�
    
    -- ���޹��� �������̵� �ش��ϴ� ���������� ��ȸ�Ѵ�.
    -- ��ȸ�� ������ �޿��� ���ؼ� ������ V_EMP_SALARY�� �����Ѵ�.
    SELECT SALARY
    INTO v_emp_salary
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = i_emp_id;
    
    -- ������ �޿��� ���� �λ���� �����ϱ�
    -- 20000�޷� �̻� 10%, 10000�޷� �̻� 15%, �� �� 20% �λ�
    IF v_emp_salary >= 20000 THEN v_update_rate := 0.1;
    ELSIF v_emp_salary >= 10000 THEN v_update_rate := 0.15;
    ELSE v_update_rate := 0.2;
    END IF;
    
    -- �޿��� �λ��Ű��
    UPDATE EMPLOYEES
    SET
        SALARY = SALARY + TRUNC(SALARY * v_update_rate)
    WHERE
        EMPLOYEE_ID = i_emp_id;
        
    -- DB�� ���������� �ݿ���Ű��
    COMMIT;
    
END;