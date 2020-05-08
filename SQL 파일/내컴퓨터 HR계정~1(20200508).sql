EXECUTE UPDATE_SALARY(100);

-- �������̵� ���޹޾Ƽ� �� ������ ������ ��ȯ�ϴ� �Լ�(Ŀ�̼��� ���Ե�)
CREATE OR REPLACE FUNCTION GET_ANNUAL_SALARY
    (i_emp_id IN NUMBER)    -- �������̵� �Ű������� ���޹޴´�.
    RETURN NUMBER           -- �� �Լ��� ��ȯ���� ���ڰ��̴�.
    
    IS
        v_salary        employees.salary % type;          -- �޿�
        v_comm          employees.commission_pct % type;  -- Ŀ�̼�
        v_annual_salary employees.salary % type;          -- ����
    
    BEGIN
        -- �������̵� �ش��ϴ� ������ �޿��� Ŀ�̼��� ��ȸ�ؼ� v_salary�� v_comm�� �����Ѵ�.
        SELECT SALARY, NVL(COMMISSION_PCT, 0)
        INTO v_salary, v_comm
        FROM EMPLOYEES
        WHERE EMPLOYEE_ID = i_emp_id;
        
        -- Ŀ�̼��� �ݿ��� ������ ����ؼ� ������ �����Ѵ�.
        v_annual_salary := v_salary * 12 * trunc(v_salary * v_comm);
    
        -- ������ ����� ���� ��ȯ�Ѵ�.
        return v_annual_salary;
        
    END;