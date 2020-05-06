-- 사용자명 scott
-- 비밀번호 tiger
CREATE USER scott IDENTIFIED BY tiger;

-- 생성된 사용자에게 데이터베이스 연결 권한 부여하기
GRANT CREATE SESSION TO SCOTT;

-- 일반 사용자에게 부여되는 시스템 권한을 그룹화 해놓은 롤을 이용해서 권한 부여하기
GRANT CONNECT, RESOURCE TO SCOTT;