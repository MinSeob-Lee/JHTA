-- ����ڸ� scott
-- ��й�ȣ tiger
CREATE USER scott IDENTIFIED BY tiger;

-- ������ ����ڿ��� �����ͺ��̽� ���� ���� �ο��ϱ�
GRANT CREATE SESSION TO SCOTT;

-- �Ϲ� ����ڿ��� �ο��Ǵ� �ý��� ������ �׷�ȭ �س��� ���� �̿��ؼ� ���� �ο��ϱ�
GRANT CONNECT, RESOURCE TO SCOTT;