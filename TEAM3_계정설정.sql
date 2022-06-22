-- ���� �� C����̺꿡 TEAM3DATA ���� ����� ����

-- ���̺����̽� ����
CREATE TABLESPACE TBS_TEAM3
DATAFILE 'C:\TEAM3DATA\TBS_TEAM3.DBF' 
SIZE 4M 
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO;
--==>> TABLESPACE TBS_TEAM3��(��) �����Ǿ����ϴ�.


-- ��� ������ �뷮�� ���������� ����
ALTER USER TEAM3
QUOTA UNLIMITED ON TBS_TEAM3;
--==>> User TEAM3��(��) ����Ǿ����ϴ�.

-- TEAM3 ���� ����
CREATE USER TEAM3 IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_TEAM3;
--==>> User TEAM3��(��) �����Ǿ����ϴ�.


-- TEAM3 ���� �ο� (������ �������� ����)
GRANT CREATE SESSION TO TEAM3; -- ����
--==>> Grant��(��) �����߽��ϴ�.
GRANT CREATE TABLE TO TEAM3; -- ���̺�
--==>> Grant��(��) �����߽��ϴ�.
GRANT CREATE PROCEDURE TO TEAM3; -- ���ν���
--==>> Grant��(��) �����߽��ϴ�.
GRANT CREATE VIEW TO TEAM3; -- ��
--==>> Grant��(��) �����߽��ϴ�.
GRANT CREATE SEQUENCE TO TEAM3; -- ������
--==>> Grant��(��) �����߽��ϴ�.
