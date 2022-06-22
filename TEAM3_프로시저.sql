-- TEAM3 ���ν���

--���� 1. ������ �α��� PRC_LOGIN_ADMIN(������ID, ��й�ȣ) ����--
CREATE OR REPLACE PROCEDURE PRC_LOGIN_ADMIN
( V_ID  IN ADMIN.ADMIN_ID%TYPE
, V_PW  IN ADMIN.PASSWORD%TYPE
)

IS
    V_IDCOUNT   NUMBER; -- ID �ִ��� ī��Ʈ�� �� 
    V_NAME      ADMIN.ADMIN_NAME%TYPE; -- �̸� ����
    V_PWTEMP    ADMIN.PASSWORD%TYPE;  -- ��й�ȣ(��ϵǾ� �ִ� ��й�ȣ)
    
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2  EXCEPTION;
    
BEGIN
    -- 1. ID�� �ִ��� Ȯ��
    SELECT COUNT(*) INTO V_IDCOUNT
    FROM ADMIN
    WHERE ADMIN_ID = V_ID;
    
    -- �Է��� ���̵� ���̺� ������ ���� �߻�(��ϵ��� ���� ���̵�)
    IF (V_IDCOUNT = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 2. ���̵�� ��й�ȣ�� ��ġ�ϴ��� Ȯ��
    SELECT PASSWORD INTO V_PWTEMP
    FROM ADMIN
    WHERE ADMIN_ID = V_ID;
    
    -- ��й�ȣ �ٸ��� ���� �߻�
    IF (V_PWTEMP != V_PW)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- 3. ���̵�, ��й�ȣ ���� ��     
    SELECT ADMIN_NAME INTO V_NAME
    FROM ADMIN
    WHERE ADMIN_ID = V_ID;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' �����ڴ� �������.');
    
    -- 4. ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '��ϵ��� ���� ���̵��Դϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002, '���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
END;
--------------------------------------------------------------------------------
--���� 2. ���� �α��� PRC_LOGIN_PROF(����ID, ��й�ȣ) ����--
CREATE OR REPLACE PROCEDURE PRC_LOGIN_PROF
( V_ID  IN PROF.PROF_ID%TYPE
, V_PW  IN PROF.PASSWORD%TYPE
)

IS
    V_IDCOUNT   NUMBER; -- ID �ִ��� ī��Ʈ�� �� 
    V_NAME      PROF.PROF_NAME%TYPE; -- �̸� ����
    V_PWTEMP    PROF.PASSWORD%TYPE;  -- ��й�ȣ(��ϵǾ� �ִ� ��й�ȣ)
    
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2  EXCEPTION;
    
BEGIN
    -- 1. ID�� �ִ��� Ȯ��
    SELECT COUNT(*) INTO V_IDCOUNT
    FROM PROF
    WHERE PROF_ID = V_ID;
    
    -- �Է��� ���̵� ���̺� ������ ���� �߻�(��ϵ��� ���� ���̵�)
    IF (V_IDCOUNT = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 2. ���̵�� ��й�ȣ�� ��ġ�ϴ��� Ȯ��
    SELECT PASSWORD INTO V_PWTEMP
    FROM PROF
    WHERE PROF_ID = V_ID;
    
    -- ��й�ȣ �ٸ��� ���� �߻�
    IF (V_PWTEMP != V_PW)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- 3. ���̵�, ��й�ȣ ���� ��     
    SELECT PROF_NAME INTO V_NAME
    FROM PROF
    WHERE PROF_ID = V_ID;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' �����ڴ� �������.');
    
    -- 4. ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '��ϵ��� ���� ���̵��Դϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002, '���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
END;
--------------------------------------------------------------------------------
--���� 3. �л� �α��� PRC_LOGIN_STU(�л�ID, ��й�ȣ) ����--
CREATE OR REPLACE PROCEDURE PRC_LOGIN_STU
( V_ID  IN STU.STU_ID%TYPE
, V_PW  IN STU.PASSWORD%TYPE
)

IS
    V_IDCOUNT   NUMBER; -- ID �ִ��� ī��Ʈ�� �� 
    V_NAME      STU.STU_NAME%TYPE; -- �̸� ����
    V_PWTEMP    STU.PASSWORD%TYPE;  -- ��й�ȣ(��ϵǾ� �ִ� ��й�ȣ)
    
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2  EXCEPTION;
    
BEGIN
    -- 1. ID�� �ִ��� Ȯ��
    SELECT COUNT(*) INTO V_IDCOUNT
    FROM STU
    WHERE STU_ID = V_ID;
    
    -- �Է��� ���̵� ���̺� ������ ���� �߻�(��ϵ��� ���� ���̵�)
    IF (V_IDCOUNT = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 2. ���̵�� ��й�ȣ�� ��ġ�ϴ��� Ȯ��
    SELECT PASSWORD INTO V_PWTEMP
    FROM STU
    WHERE STU_ID = V_ID;
    
    -- ��й�ȣ �ٸ��� ���� �߻�
    IF (V_PWTEMP != V_PW)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- 3. ���̵�, ��й�ȣ ���� ��     
    SELECT STU_NAME INTO V_NAME
    FROM STU
    WHERE STU_ID = V_ID;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' �л��� �������.');
    
    -- 4. ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '��ϵ��� ���� ���̵��Դϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002, '���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
END;
--------------------------------------------------------------------------------
--���� 4. ���� ��� PRC_PROF_INSERT(������, �ֹι�ȣ) ����--
CREATE OR REPLACE PROCEDURE PRC_PROF_INSERT
( V_NAME   IN PROF.PROF_NAME%TYPE          -- �̸�
, V_SSN    IN PROF.SSN%TYPE                -- �ֹι�ȣ
)
IS
    V_ID   PROF.PROF_ID%TYPE;               -- ID
    V_FSSN PROF.SSN%TYPE;                   -- �ֹι�ȣ �ߺ��˻��
    
    PROF_OVERLAP_ERROR EXCEPTION;           -- �ֹι�ȣ �ߺ��� ����
    
BEGIN 

     -- �ֹι�ȣ �ߺ��� ã��
    SELECT NVL((SELECT SSN 
                 FROM PROF
                 WHERE SSN = V_SSN), '0')  INTO V_FSSN-- �ߺ��� ���� �ִٸ� V_FSSN �� 0�� ��������
    FROM DUAL;
     
     IF (V_FSSN != '0') -- ������ V_FSSN �� 0�� �ƴ϶�� �ߺ��� ���� V_FSSN�� ������
        THEN RAISE PROF_OVERLAP_ERROR;
     END IF;   
     
     V_ID := CONCAT('P', TO_CHAR(SYSDATE, 'YYYY')) || LPAD(TO_CHAR(PROF_SEQ0.NEXTVAL), 5, '0'); 
     
     INSERT INTO PROF(PROF_ID, PROF_NAME, SSN, PASSWORD) 
     VALUES(V_ID, V_NAME, V_SSN, SUBSTR(V_SSN,8));
     
    EXCEPTION
       
        WHEN PROF_OVERLAP_ERROR
        THEN RAISE_APPLICATION_ERROR(-20003, '�̵̹�ϵ� �ֹι�ȣ�Դϴ�.');
        ROLLBACK;
        WHEN OTHERS
        THEN ROLLBACK;
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 5. ���� ���� PRC_PROF_UPDATE(����ID, �ֹι�ȣ) ����--
CREATE OR REPLACE PROCEDURE PRC_PROF_UPDATE
( V_PROF_ID       IN PROF.PROF_ID%TYPE 
, V_SSN           IN PROF.SSN %TYPE     
)
IS
    V_FSSN PROF.SSN%TYPE;                   -- �ֹι�ȣ �ߺ��˻��
    
    PROF_OVERLAP_ERROR EXCEPTION;           -- �ֹι�ȣ �ߺ��� ����
BEGIN
    
    -- �ֹι�ȣ �ߺ��� ã��
    SELECT NVL((SELECT SSN 
                 FROM PROF
                 WHERE SSN = V_SSN), '0')  INTO V_FSSN -- �ߺ��� ���� �ִٸ� V_FSSN �� 0�� ��������
    FROM DUAL;
    
    IF (V_FSSN != '0') -- ������ V_FSSN �� 0�� �ƴ϶�� �ߺ��� ���� V_FSSN�� ������
        THEN RAISE PROF_OVERLAP_ERROR;
    END IF;  
    
    -- ���� �ֹε�Ϲ�ȣ ����
    UPDATE PROF
    SET SSN = V_SSN 
    WHERE PROF_ID = V_PROF_ID;
    
    EXCEPTION   
        WHEN PROF_OVERLAP_ERROR
        THEN RAISE_APPLICATION_ERROR(-20003, '�̵̹�ϵ� �ֹι�ȣ�Դϴ�.');
        ROLLBACK;
        WHEN OTHERS
        THEN ROLLBACK;
        
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 6. ���� ���� PRC_PROF_DELETE(����ID) ����--
CREATE OR REPLACE PROCEDURE PRC_PROF_DELETE
(
    -- ���̵� �Է� ����
    V_PROF_ID IN PROF.PROF_ID%TYPE
)
IS
    -- ���� ���� ����
    -- ã�� �����Ͱ� �������� �ʴ� ����
    NOTEXIST_ERROR EXCEPTION;
BEGIN
    -- ���� ���̺��� ID�� ��ȸ �� ����
    DELETE
    FROM PROF
    WHERE PROF_ID = V_PROF_ID;
    
    -- ��� ������ ��� ROW ���� 0�̸� TRUE, �ƴϸ� FALSE�� ��ȯ(������ Ŀ�� �̿�)
    -- ��ȸ ��� ���� 0�� ��쿣 ���� �߻�
    IF SQL%NOTFOUND
    THEN RAISE NOTEXIST_ERROR;
    END IF;

COMMIT;

EXCEPTION
    WHEN NOTEXIST_ERROR
        THEN RAISE_APPLICATION_ERROR(-20005,'��ġ�ϴ� �����Ͱ� �����ϴ�.');
            ROLLBACK;
    WHEN OTHERS
        THEN ROLLBACK;
END;
--------------------------------------------------------------------------------
--���� 7. ���� ����2 PRC_PROF_DELETE_1 (Ʈ����) ����--
-- �۱��� ���� Ʈ����
-- ���� ���� ��, �������������� ����
CREATE OR REPLACE TRIGGER PRC_PROF_DELETE_1
    BEFORE
    DELETE ON PROF
    FOR EACH ROW
BEGIN
    DELETE
    FROM OPEN_COUR
    WHERE PROF_ID=:OLD.PROF_ID;
END;

DROP PROCEDURE PROF_DELETE;
DROP TRIGGER PROF_DELETE_1;
--------------------------------------------------------------------------------
--���� 8. �л� ��� PRC_STU_INSERT(�л���, �ֹι�ȣ) ����--
CREATE OR REPLACE PROCEDURE PRC_STU_INSERT
( V_NAME   IN STU.STU_NAME%TYPE          -- �̸�
, V_SSN    IN STU.SSN%TYPE                -- �ֹι�ȣ
)
IS
    V_ID   STU.STU_ID%TYPE;            -- ID
    V_FSSN STU.SSN%TYPE;                   -- �ֹι�ȣ �ߺ��˻��
    
    PROF_OVERLAP_ERROR EXCEPTION;           -- �ֹι�ȣ �ߺ��� ����
    
BEGIN 

     -- �ֹι�ȣ �ߺ��� ã��
    SELECT NVL((SELECT SSN 
                 FROM STU
                 WHERE SSN = V_SSN), '0')  INTO V_FSSN-- �ߺ��� ���� �ִٸ� V_FSSN �� 0�� ��������
    FROM DUAL;
     
     IF (V_FSSN != '0') -- ������ V_FSSN �� 0�� �ƴ϶�� �ߺ��� ���� V_FSSN�� ������
        THEN RAISE PROF_OVERLAP_ERROR;
     END IF;   
     
     V_ID := CONCAT('S', TO_CHAR(SYSDATE, 'YYYY')) || LPAD(TO_CHAR(STU_SEQ0.NEXTVAL), 5, '0'); 
     
     INSERT INTO STU(STU_ID, STU_NAME, SSN, PASSWORD) 
     VALUES(V_ID, V_NAME, V_SSN, SUBSTR(V_SSN,8));
     
    EXCEPTION
       
        WHEN PROF_OVERLAP_ERROR
        THEN RAISE_APPLICATION_ERROR(-20003, '�̵̹�ϵ� �ֹι�ȣ�Դϴ�.');
        ROLLBACK;
        WHEN OTHERS
        THEN ROLLBACK;
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 9.�л� ���� PRC_STU_UPDATE(�л�ID, �ֹι�ȣ) ����--
CREATE OR REPLACE PROCEDURE PRC_STU_UPDATE
( V_STU_ID        IN STU.STU_ID %TYPE 
, V_SSN           IN STU.SSN %TYPE     
)
IS
    V_FSSN STU.SSN%TYPE;                   -- �ֹι�ȣ �ߺ��˻��
    
    PROF_OVERLAP_ERROR EXCEPTION;           -- �ֹι�ȣ �ߺ��� ����
BEGIN
    
    -- �ֹι�ȣ �ߺ��� ã��
    SELECT NVL((SELECT SSN 
                 FROM STU
                 WHERE SSN = V_SSN), '0')  INTO V_FSSN-- �ߺ��� ���� �ִٸ� V_FSSN �� 0�� ��������
    FROM DUAL;
     
     IF (V_FSSN != '0') -- ������ V_FSSN �� 0�� �ƴ϶�� �ߺ��� ���� V_FSSN�� ������
        THEN RAISE PROF_OVERLAP_ERROR;
     END IF;   
    
    -- �л� �ֹε�Ϲ�ȣ ����
    UPDATE STU
    SET SSN = V_SSN 
    WHERE STU_ID = V_STU_ID;
    
    EXCEPTION
        WHEN PROF_OVERLAP_ERROR
        THEN RAISE_APPLICATION_ERROR(-20003, '�̵̹�ϵ� �ֹι�ȣ�Դϴ�.');
        ROLLBACK;
        WHEN OTHERS
        THEN ROLLBACK;
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 10. �л� ���� PRC_STU_DELETE(�л�ID) ����--
CREATE OR REPLACE PROCEDURE PRC_STU_DELETE
(
    V_STU_ID    IN STU.STU_ID%TYPE
)
IS
    NOTEXIST_ERROR EXCEPTION;
BEGIN
    DELETE
    FROM STU
    WHERE STU_ID = V_STU_ID; 

    -- ��� ������ ��� ROW ���� 0�̸� TRUE, �ƴϸ� FALSE�� ��ȯ
    -- ��ȸ ��� ���� 0�� ��쿣 ���� �߻�    
    IF SQL%NOTFOUND 
    THEN RAISE NOTEXIST_ERROR;
    END IF;
     
    COMMIT;
    
    EXCEPTION
        WHEN NOTEXIST_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005,'��ġ�ϴ� �����Ͱ� �����ϴ�.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;  
END;
--------------------------------------------------------------------------------
--���� 11. �л� ����2 PRC_STU_DELETE_1 (Ʈ����) ����--
--�� �л� ���� Ʈ����
--> �л����� DELETE�� ������� �� 
--> ������û ���̺����� �л� ����
-- �������������� ���� ����
CREATE OR REPLACE TRIGGER PRC_STU_DELETE_1
    BEFORE
    DELETE ON STU
    FOR EACH ROW
BEGIN
    DELETE
    FROM APP
    WHERE STU_ID=:OLD.STU_ID;
END; 
--------------------------------------------------------------------------------
--���� 12. ���� ��� PRC_COURSE_INSERT(������) ����--
CREATE OR REPLACE PROCEDURE PRC_COURSE_INSERT
( V_COURSE_NAME IN COURSE.COURSE_NAME%TYPE
)
IS
-- �����
    --V_COURSE_ID         COURSE.COURSE_ID%TYPE;
    CHECK_COURSE_NAME   COURSE.COURSE_NAME%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    
    SELECT NVL((SELECT COURSE_NAME
               FROM COURSE
               WHERE COURSE_NAME = V_COURSE_NAME),'0') INTO CHECK_COURSE_NAME
    FROM DUAL;
    
    IF (CHECK_COURSE_NAME != '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ������ ������ �� ��Ƴ���
    --V_COURSE_ID := ('C' || LPAD(TO_CHAR(COURSE_SEQ.NEXTVAL), 5, '0'));

    -- INSERT ������ ����
    INSERT INTO COURSE(COURSE_ID, COURSE_NAME)
    VALUES(('C' || LPAD(TO_CHAR(COURSE_SEQ.NEXTVAL), 5, '0')), V_COURSE_NAME);
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20004, '�̹� ��ϵ� �����Դϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 13. ���� ���� PRC_COURSE_UPDATE(����ID, ������) ����--
CREATE OR REPLACE PROCEDURE PRC_COURSE_UPDATE
( V_COURSE_ID   IN COURSE.COURSE_ID%TYPE
, V_COURSE_NAME IN COURSE.COURSE_NAME%TYPE
)
IS
       CHECK_COURSE_NAME   COURSE.COURSE_NAME%TYPE;
       USER_DEFINE_ERROR EXCEPTION;
BEGIN
    
    SELECT NVL((SELECT COURSE_NAME
               FROM COURSE
               WHERE COURSE_NAME = V_COURSE_NAME),'0') INTO CHECK_COURSE_NAME
    FROM DUAL;
    
    IF (CHECK_COURSE_NAME != '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ���� �̸� ����
    UPDATE COURSE
    SET COURSE_NAME = V_COURSE_NAME
    WHERE COURSE_ID = V_COURSE_ID;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20004, '�̹� ��ϵ� �����Դϴ�.' );
        ROLLBACK;
    
    COMMIT;
    
END;
--------------------------------------------------------------------------------
--���� 14. ���� ���� PRC_COURSE_DELETE(����ID) ����--
CREATE OR REPLACE PROCEDURE PRC_COURSE_DELETE
(
    V_COURSE_ID IN COURSE.COURSE_ID%TYPE
)
IS
    NOTEXIST_ERROR EXCEPTION;
BEGIN
    DELETE
    FROM COURSE
    WHERE COURSE_ID = V_COURSE_ID;

    -- ��� ������ ��� ROW ���� 0�̸� TRUE, �ƴϸ� FALSE�� ��ȯ
    -- ��ȸ ��� ���� 0�� ��쿣 ���� �߻�    
    IF SQL%NOTFOUND 
    THEN RAISE NOTEXIST_ERROR;
    END IF;
    
    COMMIT;

EXCEPTION
    WHEN NOTEXIST_ERROR
        THEN RAISE_APPLICATION_ERROR(-20005,'��ġ�ϴ� �����Ͱ� �����ϴ�.');
            ROLLBACK;
    WHEN OTHERS
        THEN ROLLBACK;        
END;
--------------------------------------------------------------------------------
--���� 15. ���� ����2 PRC_COURSE_DELETE_1 (Ʈ����) ����--
--�� ���� ���� Ʈ����
--> �������� DELETE�� ������� �� 
--> �������� ���̺����� ���� ����
-- �������������� ���� ����
CREATE OR REPLACE TRIGGER PRC_COURSE_DELETE_1
    BEFORE
    DELETE ON COURSE
    FOR EACH ROW
BEGIN
    DELETE
    FROM OPEN_COUR
    WHERE COURSE_ID=:OLD.COURSE_ID;
END; 
--------------------------------------------------------------------------------
--���� 16. ���� ��� PRC_SUBJECT_INSERT(�����) ����--
CREATE OR REPLACE PROCEDURE PRC_SUBJECT_INSERT
( V_SUBJECT_NAME IN SUBJECT.SUBJECT_NAME%TYPE
)
IS
-- �����
    --V_SUBJECT_ID         SUBJECT.SUBJECT_ID%TYPE;
    CHECK_SUBJECT_NAME   SUBJECT.SUBJECT_NAME%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    
    SELECT NVL((SELECT SUBJECT_NAME
               FROM SUBJECT
               WHERE SUBJECT_NAME = V_SUBJECT_NAME),'0') INTO CHECK_SUBJECT_NAME
    FROM DUAL;
    
    IF (CHECK_SUBJECT_NAME != '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ������ ������ �� ��Ƴ���
    --V_SUBJECT_ID := ('SB' || LPAD(TO_CHAR(SUBJECT_SEQ.NEXTVAL), 5, '0'));

    -- INSERT ������ ����
    INSERT INTO SUBJECT(SUBJECT_ID, SUBJECT_NAME)
    VALUES(('SB' || LPAD(TO_CHAR(SUBJECT_SEQ.NEXTVAL), 5, '0')), V_SUBJECT_NAME);
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20004, '�̹� ��ϵ� �����Դϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 17. ���� ���� PRC_SUBJECT_UPDATE(����ID, �����) ����--
CREATE OR REPLACE PROCEDURE PRC_SUBJECT_UPDATE
( V_SUBJECT_ID        IN SUBJECT.SUBJECT_ID%TYPE
, V_SUBJECT_NAME	  IN SUBJECT.SUBJECT_NAME%TYPE
)
IS
    CHECK_SUBJECT_NAME   SUBJECT.SUBJECT_NAME%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    
    SELECT NVL((SELECT SUBJECT_NAME
               FROM SUBJECT
               WHERE SUBJECT_NAME = V_SUBJECT_NAME),'0') INTO CHECK_SUBJECT_NAME
    FROM DUAL;
    
    IF (CHECK_SUBJECT_NAME != '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ���� �̸� ����
    UPDATE SUBJECT
    SET SUBJECT_NAME = V_SUBJECT_NAME
    WHERE SUBJECT_ID = V_SUBJECT_ID;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20026, '�̹� ��ϵ� �����Դϴ�.' );
        ROLLBACK;
    
    -- Ŀ��
    COMMIT;
    
END;
--------------------------------------------------------------------------------
--���� 18. ���� ���� PRC_SUBJECT_DELETE(����ID) ����--
CREATE OR REPLACE PROCEDURE PRC_SUBJECT_DELETE
(
    V_SUBJECT_ID IN SUBJECT.SUBJECT_ID%TYPE
)
IS
    NOTEXIST_ERROR EXCEPTION;
BEGIN
    DELETE
    FROM SUBJECT
    WHERE SUBJECT_ID = V_SUBJECT_ID;

    -- ��� ������ ��� ROW ���� 0�̸� TRUE, �ƴϸ� FALSE�� ��ȯ
    -- ��ȸ ��� ���� 0�� ��쿣 ���� �߻�        
    IF SQL%NOTFOUND 
    THEN RAISE NOTEXIST_ERROR;
    END IF;
    
    COMMIT;
    
    EXCEPTION 
        WHEN NOTEXIST_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005,'��ġ�ϴ� �����Ͱ� �����ϴ�.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--------------------------------------------------------------------------------
--���� 19. ���� ����2 PRC_SUBJECT_DELETE_1 (Ʈ����) ����--
--�� ���� ���� Ʈ����
--> ���񿡼� DELETE�� ������� �� 
--> �������� ���̺����� ���� ����
-- ���������񿡼� ���� ����
CREATE OR REPLACE TRIGGER PRC_SUBJECT_DELETE_1
    BEFORE
    DELETE ON SUBJECT
    FOR EACH ROW
BEGIN
    DELETE
    FROM OPEN_SUBJ
    WHERE SUBJECT_ID = :OLD.SUBJECT_ID;
END;
--------------------------------------------------------------------------------
--���� 20. ���� �Է� PRC_SCORE_INSERT(��������ID,������ûID,���,�ʱ�,�Ǳ�) ����--
CREATE OR REPLACE PROCEDURE PRC_SCORE_INSERT
(
    V_OPEN_SUBJ_ID      IN SCORE.OPEN_SUBJ_ID%TYPE      -- ���������ڵ�   
   ,V_APP_ID            IN SCORE.APP_ID%TYPE            -- ������û�ڵ�
   ,V_ATTEND_SCORE      IN SCORE.ATTEND_SCORE%TYPE      -- ��Ἲ��
   ,V_WRITE_SCORE       IN SCORE.WRITE_SCORE%TYPE       -- �ʱ⼺��
   ,V_PRACTICE_SCORE    IN SCORE.PRACTICE_SCORE%TYPE    -- �Ǳ⼺��
)
IS
    V_SCORE_ID  SCORE.SCORE_ID%TYPE;                -- ���� �ڵ�
    V_MID_DROP    NUMBER;                           -- �ߵ�����  
    MID_DROP_STU_ERROR EXCEPTION;                   -- �ߵ����⿡��     
BEGIN
    SELECT COUNT(*) INTO V_MID_DROP
    FROM DROPOUT
    WHERE APP_ID = V_APP_ID;
    
    -- �ߵ������� ������ �Է��Ϸ��� �� �� ���� �߻�
    IF (V_MID_DROP> 0)
        THEN RAISE MID_DROP_STU_ERROR;
    END IF;
    
    --SCORE_ID + ������ ��ȣ ǥ�� 
    V_SCORE_ID := 'S'||TO_CHAR(SYSDATE,'YY');
    
    -- �������̺� INSERT
    INSERT INTO SCORE(SCORE_ID, OPEN_SUBJ_ID, APP_ID, ATTEND_SCORE, WRITE_SCORE, PRACTICE_SCORE)
    VALUES(V_SCORE_ID||LPAD(TO_CHAR(SEQ_SCORE_ID.NEXTVAL),5,'0'), V_OPEN_SUBJ_ID, V_APP_ID, 
          V_ATTEND_SCORE, V_WRITE_SCORE, V_PRACTICE_SCORE);

    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN MID_DROP_STU_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20007, '�ߵ������� �����Դϴ�.');
                ROLLBACK;
         WHEN OTHERS
            THEN ROLLBACK;
END;
--------------------------------------------------------------------------------
--���� 21. ���� ���� PRC_SCORE_UPDATE(����ID, ���, �ʱ�, �Ǳ�) ����--
CREATE OR REPLACE PROCEDURE PRC_SCORE_UPDATE
(
    V_SCORE_ID          IN SCORE. SCORE_ID%TYPE
   ,V_ATTEND_SCORE      IN SCORE.ATTEND_SCORE%TYPE
   ,V_WRITE_SCORE       IN SCORE.WRITE_SCORE%TYPE
   ,V_PRACTICE_SCORE    IN SCORE.PRACTICE_SCORE%TYPE
)
IS
BEGIN
    -- ���, �ʱ�, �Ǳ� ������Ʈ
    UPDATE SCORE
    SET ATTEND_SCORE = V_ATTEND_SCORE, WRITE_SCORE = V_WRITE_SCORE, PRACTICE_SCORE = V_PRACTICE_SCORE
    WHERE SCORE_ID = V_SCORE_ID;
END;
--------------------------------------------------------------------------------
--���� 22. ���� ���� PRC_SCORE_DELETE(����ID) ����--
CREATE OR REPLACE PROCEDURE PRC_SCORE_DELETE
(
    V_SCORE_ID IN SCORE.SCORE_ID%TYPE
)
IS
    NOTEXIST_ERROR EXCEPTION;
BEGIN
    DELETE
    FROM SCORE
    WHERE SCORE_ID = V_SCORE_ID;
    
    -- ��� ������ ��� ROW ���� 0�̸� TRUE, �ƴϸ� FALSE�� ��ȯ
    -- ��ȸ ��� ���� 0�� ��쿣 ���� �߻�
    IF SQL%NOTFOUND
    THEN RAISE NOTEXIST_ERROR;
    END IF;
    
    COMMIT;
    
    EXCEPTION 
        WHEN NOTEXIST_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005,'��ġ�ϴ� �����Ͱ� �����ϴ�.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;    
END;
--------------------------------------------------------------------------------
--���� 23. ���� �ο� PRC_SCORE_POINT ����--
CREATE OR REPLACE PROCEDURE PRC_SCORE_POINT
(
     V_OPEN_SUBJ_ID   IN OPEN_SUBJ.OPEN_SUBJ_ID%TYPE
    ,V_WRITE_POINT    IN OPEN_SUBJ.WRITE_POINT%TYPE     -- �ʱ����
    ,V_PRACTICE_POINT IN OPEN_SUBJ.PRACTICE_POINT%TYPE  -- �Ǳ����
    ,V_ATTEND_POINT   IN OPEN_SUBJ.ATTEND_POINT%TYPE    -- ������
)
IS
BEGIN
    UPDATE OPEN_SUBJ
    SET WRITE_POINT = V_WRITE_POINT, PRACTICE_POINT = V_PRACTICE_POINT, ATTEND_POINT = V_ATTEND_POINT
    WHERE OPEN_SUBJ_ID = V_OPEN_SUBJ_ID;
END;
--------------------------------------------------------------------------------
--���� 24. �������� ���� �Լ� TOTAL_SCORE ����--
CREATE OR REPLACE FUNCTION TOTAL_SCORE
(
    --���� SCORE,  ��������(����) OPEN_SUBJ ȣ��
    V_SCORE_ID IN SCORE.SCORE_ID%TYPE
   ,V_OPEN_SUBJ_ID IN OPEN_SUBJ.OPEN_SUBJ_ID%TYPE
)
    -- ���ڰ��� ����
    RETURN NUMBER
IS
    -- �ֿ� ���� ����
    RESULT NUMBER;
    
    V_P_POINT OPEN_SUBJ.PRACTICE_POINT%TYPE;
    V_W_POINT OPEN_SUBJ.WRITE_POINT%TYPE;
    V_A_POINT OPEN_SUBJ.ATTEND_POINT%TYPE;
    
    V_P_SCORE SCORE.PRACTICE_SCORE%TYPE;
    V_W_SCORE SCORE.WRITE_SCORE%TYPE;
    V_A_SCORE SCORE.ATTEND_SCORE%TYPE;
    
BEGIN
    -- ���� �޾ƿ���
    -- NULL�� ��� 0���� ġȯ
    SELECT NVL(PRACTICE_POINT,0), NVL(WRITE_POINT,0), NVL(ATTEND_POINT,0) INTO V_P_POINT, V_W_POINT, V_A_POINT
    FROM OPEN_SUBJ
    WHERE OPEN_SUBJ_ID = V_OPEN_SUBJ_ID;
    
    -- ���� �޾ƿ���
    -- NULL�� ��� 0���� ġȯ    
    SELECT NVL(PRACTICE_SCORE,0), NVL(WRITE_SCORE,0), NVL(ATTEND_SCORE,0) INTO V_P_SCORE, V_W_SCORE, V_A_SCORE
    FROM SCORE
    WHERE SCORE_ID = V_SCORE_ID;

    RESULT := (V_P_POINT*V_P_SCORE + V_W_POINT*V_W_SCORE + V_A_POINT*V_A_SCORE)/100;

    -- ���� ��� ��ȯ
    RETURN RESULT;
END;
--------------------------------------------------------------------------------
--���� 25. ���� ��� PRC_BOOK_INSERT(�����, ���ǻ�) ����--
CREATE OR REPLACE PROCEDURE PRC_BOOK_INSERT
( V_BOOK_NAME IN BOOK.BOOK_NAME%TYPE
, V_BOOK_PUB IN BOOK.BOOK_PUB%TYPE
)
IS
-- �����
    --V_BOOK_ID      BOOK.BOOK_ID%TYPE;
    CHECK_BOOK_NAME   BOOK.BOOK_NAME%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    
    SELECT NVL((SELECT BOOK_NAME
               FROM BOOK
               WHERE BOOK_NAME = V_BOOK_NAME),'0') INTO CHECK_BOOK_NAME
    FROM DUAL;
    
    IF (CHECK_BOOK_NAME != '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ������ ������ �� ��Ƴ���
    --V_BOOK_ID := ('BK' || LPAD(TO_CHAR(BOOK_SEQ.NEXTVAL), 3, '0'));

    -- INSERT ������ ����
    INSERT INTO BOOK(BOOK_ID, BOOK_NAME, BOOK_PUB)
    VALUES(('BK' || LPAD(TO_CHAR(BOOK_SEQ.NEXTVAL), 3, '0')), V_BOOK_NAME, V_BOOK_PUB);
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20004, '�̹� ��ϵ� �����Դϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 26. ���� ���� PRC_BOOK_UPDATE(����ID, �����, ���ǻ�) ����--
CREATE OR REPLACE PROCEDURE PRC_BOOK_UPDATE
( V_BOOK_ID     IN BOOK.BOOK_ID%TYPE
, NEW_BOOK_NAME   IN BOOK.BOOK_NAME%TYPE
, NEW_BOOK_PUB    IN BOOK.BOOK_PUB%TYPE
)
IS
-- �����
    CHECK_BOOK_NAME   BOOK.BOOK_NAME%TYPE;
    CHECK_BOOK_ID     BOOK.BOOK_ID%TYPE;
    
    USER_DEFINE_ERROR  EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
    
BEGIN
    
    -- ����ID�� ������ ����
    SELECT NVL((SELECT BOOK_ID
               FROM BOOK
               WHERE BOOK_ID = V_BOOK_ID),'0') INTO CHECK_BOOK_ID
    FROM DUAL;
    
    IF (CHECK_BOOK_ID = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- �̹� ��ϵ� ������̸� ����
    SELECT NVL((SELECT BOOK_NAME
               FROM BOOK
               WHERE BOOK_NAME = NEW_BOOK_NAME),'0') INTO CHECK_BOOK_NAME
    FROM DUAL;
    
    IF (CHECK_BOOK_NAME != '0')
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;


    -- UPDATE ������ ����
    UPDATE BOOK
    SET BOOK_NAME = NEW_BOOK_NAME, BOOK_PUB = NEW_BOOK_PUB
    WHERE BOOK_ID = V_BOOK_ID;
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20004, '��ϵ��� ���� ����ID�Դϴ�.' );
    WHEN USER_DEFINE_ERROR2
    THEN RAISE_APPLICATION_ERROR(-20004, '�̹� ��ϵ� �����Դϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 27. ���� ���� PRC_BOOK_DELETE(����ID) ����--
CREATE OR REPLACE PROCEDURE PRC_BOOK_DELETE
( V_BOOK_ID     IN BOOK.BOOK_ID%TYPE
)
IS
-- �����
    CHECK_BOOK_ID     BOOK.BOOK_ID%TYPE;
    
    USER_DEFINE_ERROR  EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
    
BEGIN
    
    -- ����ID�� ������ ����
    SELECT NVL((SELECT BOOK_ID
               FROM BOOK
               WHERE BOOK_ID = V_BOOK_ID),'0') INTO CHECK_BOOK_ID
    FROM DUAL;
    
    IF (CHECK_BOOK_ID = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- �ش� ���縦 �̹� ��� ���� ������ �ֽ��ϴ�.
    SELECT NVL((SELECT BOOK_ID
               FROM OPEN_SUBJ
               WHERE BOOK_ID = V_BOOK_ID),'0') INTO CHECK_BOOK_ID
    FROM DUAL;
    
    IF (CHECK_BOOK_ID = V_BOOK_ID)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;


    -- DELETE ������ ����
    DELETE
    FROM BOOK
    WHERE BOOK_ID = V_BOOK_ID;
    
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20004, '��ϵ��� ���� �����Դϴ�.' );
    WHEN USER_DEFINE_ERROR2
    THEN RAISE_APPLICATION_ERROR(-20004, '�ش� ���縦 �̹� ��� ���� ������ �ֽ��ϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 28. ���ǽ� ��� PRC_CLASS_INSERT(���ǽǸ�) ����--
CREATE OR REPLACE PROCEDURE PRC_CLASS_INSERT
( V_CLASS_NAME IN CLASS.CLASS_NAME%TYPE
)
IS
-- �����
    --V_CLASS_ID      CLASS.CLASS_ID%TYPE;
    CHECK_CLASS_NAME   CLASS.CLASS_NAME%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    
    SELECT NVL((SELECT CLASS_NAME
               FROM CLASS
               WHERE CLASS_NAME = V_CLASS_NAME),'0') INTO CHECK_CLASS_NAME
    FROM DUAL;
    
    IF (CHECK_CLASS_NAME != '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ������ ������ �� ��Ƴ���
    --V_CLASS_ID := ('BK' || LPAD(TO_CHAR(CLASS_SEQ.NEXTVAL), 3, '0'));

    -- INSERT ������ ����
    INSERT INTO CLASS(CLASS_ID, CLASS_NAME)
    VALUES(('BK' || LPAD(TO_CHAR(CLASS_SEQ.NEXTVAL), 3, '0')), V_CLASS_NAME);
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20004, '�̹� ��ϵ� �����Դϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 29. ���ǽ� ���� PRC_CLASS_UPDATE(���ǽ�ID, ���ǽǸ�) ����--
CREATE OR REPLACE PROCEDURE PRC_CLASS_UPDATE
( V_CLASS_ID IN CLASS.CLASS_ID%TYPE
, NEW_CLASS_NAME IN CLASS.CLASS_NAME%TYPE
)
IS
    -- �����
    CHECK_CLASS_ID   CLASS.CLASS_ID%TYPE;
    CHECK_CLASS_NAME   CLASS.CLASS_NAME%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
    
BEGIN
    
    -- �����ϴ� ���ǽ�ID���� Ȯ��
    SELECT NVL((SELECT CLASS_ID
               FROM CLASS
               WHERE CLASS_ID = V_CLASS_ID),'0') INTO CHECK_CLASS_ID
    FROM DUAL;
    
    IF (CHECK_CLASS_ID = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    -- �̹� ������� ���ǽǸ����� Ȯ��
    SELECT NVL((SELECT CLASS_NAME
               FROM CLASS
               WHERE CLASS_NAME = NEW_CLASS_NAME),'0') INTO CHECK_CLASS_NAME
    FROM DUAL;
    
    IF (CHECK_CLASS_NAME = NEW_CLASS_NAME)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;


    -- INSERT ������ ����
    UPDATE CLASS
    SET CLASS_NAME = NEW_CLASS_NAME
    WHERE CLASS_ID = V_CLASS_ID;
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20004, '�������� �ʴ� ���ǽ�ID �Դϴ�.' );
    WHEN USER_DEFINE_ERROR2
    THEN RAISE_APPLICATION_ERROR(-20004, '�̹� ��� ���� ���ǽǸ� �Դϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 30. ���ǽ� ���� PRC_CLASS_DELETE(���ǽ�ID) ����--
CREATE OR REPLACE PROCEDURE PRC_CLASS_DELETE
( V_CLASS_ID IN CLASS.CLASS_ID%TYPE
)
IS
-- �����
    CHECK_CLASS_ID      CLASS.CLASS_ID%TYPE;
    CHECK_CLASS_NAME   CLASS.CLASS_NAME%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
BEGIN
    
    -- �����ϴ� ���ǽ�ID���� Ȯ��
    SELECT NVL((SELECT CLASS_ID
               FROM CLASS
               WHERE CLASS_ID = V_CLASS_ID),'0') INTO CHECK_CLASS_ID
    FROM DUAL;
    
    IF (CHECK_CLASS_ID = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    -- �̹� ������� ���������� �ִ��� Ȯ��
    SELECT NVL((SELECT CLASS_ID
               FROM OPEN_COUR
               WHERE CLASS_ID = V_CLASS_ID),'0') INTO CHECK_CLASS_ID
    FROM DUAL;
    
    IF (CHECK_CLASS_ID = V_CLASS_ID)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;


    -- DELETE ������ ����
    DELETE
    FROM CLASS
    WHERE CLASS_ID = V_CLASS_ID;
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20004, '�������� �ʴ� ���ǽ�ID �Դϴ�.' );
    WHEN USER_DEFINE_ERROR2
    THEN RAISE_APPLICATION_ERROR(-20004, '�ش� ���ǽ��� ����ϴ� ���������� �ֽ��ϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 31. ���� ��û �Է� PRC_APP_INSERT(��������ID, �л�ID) ����--
CREATE OR REPLACE PROCEDURE PRC_APP_INSERT
( V_OPEN_COUR_ID IN OPEN_COUR.OPEN_COUR_ID%TYPE
, V_STU_ID IN STU.STU_ID%TYPE
)
IS
-- �����
    --V_APP_ID          CLASS.CLASS_ID%TYPE;
    CHECK_STU_ID        STU.STU_ID%TYPE; -- �ش� ���������ڵ忡 �л�ID�� �ߺ����� �� �� ������
    CHECK_OPEN_COUR_ID  OPEN_COUR.OPEN_COUR_ID%TYPE;
    CHECK_START_DATE    OPEN_COUR.START_DATE%TYPE;
    CHECK_APP_ID        APP.APP_ID%TYPE;

    
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;
    USER_DEFINE_ERROR3   EXCEPTION;
    
BEGIN
    
    -- �л��� ������ Ȯ��
    SELECT NVL((SELECT STU_ID
               FROM STU
               WHERE STU_ID = V_STU_ID),'0') INTO CHECK_STU_ID
    FROM DUAL;
    
    IF (CHECK_STU_ID = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    -- ������ ������ ������ Ȯ��
    SELECT NVL((SELECT OPEN_COUR_ID
               FROM OPEN_COUR
               WHERE OPEN_COUR_ID = V_OPEN_COUR_ID),'0') INTO CHECK_OPEN_COUR_ID
    FROM DUAL;
    
    IF (CHECK_OPEN_COUR_ID = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    -- ������û�� �������� Ȯ��
    SELECT START_DATE   INTO CHECK_START_DATE
    FROM OPEN_COUR
    WHERE OPEN_COUR_ID = V_OPEN_COUR_ID;
    
    IF (SYSDATE > CHECK_START_DATE)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    
    -- �̹� ������û �ߴ��� Ȯ��
    SELECT NVL((SELECT STU_ID
               FROM APP
               WHERE OPEN_COUR_ID = V_OPEN_COUR_ID),'0') INTO CHECK_STU_ID
    FROM DUAL;
    
    IF (CHECK_STU_ID = V_STU_ID)
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    

    -- ������ ������ �� ��Ƴ���
    --V_APP_ID := ('BK' || LPAD(TO_CHAR(CLASS_SEQ.NEXTVAL), 3, '0'));

    -- INSERT ������ ����
    INSERT INTO APP(APP_ID, OPEN_COUR_ID, STU_ID) -- APP_DATE�� SYSDATE ����Ʈ
    VALUES(('AP' || LPAD(TO_CHAR(APP_SEQ.NEXTVAL), 3, '0')), V_OPEN_COUR_ID, V_STU_ID);
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20009, '�л��̳� ������ ã�� �� �����ϴ�.' );
    WHEN USER_DEFINE_ERROR2
    THEN RAISE_APPLICATION_ERROR(-20010, '������û(���� �� öȸ) �Ⱓ�� �������ϴ�.' );
    WHEN USER_DEFINE_ERROR3
    THEN RAISE_APPLICATION_ERROR(-20011, '�̹� ������û�� �����Դϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 32. ���� ��û ���� PRC_APP_UPDATE(������ûID, �������ID) ����--
CREATE OR REPLACE PROCEDURE PRC_APP_UPDATE
( V_APP_ID IN APP.APP_ID%TYPE
, NEW_OPEN_COUR_ID IN OPEN_COUR.OPEN_COUR_ID%TYPE
)
IS
-- �����
    V_STU_ID          STU.STU_ID%TYPE;
    V_OPEN_COUR_ID      OPEN_COUR.OPEN_COUR_ID%TYPE;
    
    CHECK_STU_ID        STU.STU_ID%TYPE;
    CHECK_OPEN_COUR_ID  OPEN_COUR.OPEN_COUR_ID%TYPE;
    CHECK_START_DATE    OPEN_COUR.START_DATE%TYPE;
    CHECK_APP_ID        APP.APP_ID%TYPE;

    
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;
    USER_DEFINE_ERROR3   EXCEPTION;
    USER_DEFINE_ERROR4   EXCEPTION;
    
BEGIN
    
    -- ������ûID�� ������ Ȯ��
    SELECT NVL((SELECT APP_ID
               FROM APP
               WHERE APP_ID = V_APP_ID),'0') INTO CHECK_APP_ID
    FROM DUAL;
    
    IF (CHECK_APP_ID = '0')
        THEN RAISE USER_DEFINE_ERROR4;
    END IF;
    
    
    -- ������ ������ ������ Ȯ��(���� �� ��������)
    SELECT NVL((SELECT OPEN_COUR_ID
               FROM OPEN_COUR
               WHERE OPEN_COUR_ID = NEW_OPEN_COUR_ID),'0') INTO CHECK_OPEN_COUR_ID
    FROM DUAL;
    
    IF (CHECK_OPEN_COUR_ID = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ������ ���ֱ�
    SELECT OPEN_COUR_ID, STU_ID INTO V_OPEN_COUR_ID, V_STU_ID
    FROM APP
    WHERE APP_ID = V_APP_ID;
    
    
    -- ������û�� �������� Ȯ�� (���� ��)
    SELECT START_DATE   INTO CHECK_START_DATE
    FROM OPEN_COUR
    WHERE OPEN_COUR_ID = V_OPEN_COUR_ID;
    
    IF (SYSDATE > CHECK_START_DATE)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- ������û�� �������� Ȯ�� (���� ��)
    SELECT START_DATE   INTO CHECK_START_DATE
    FROM OPEN_COUR
    WHERE OPEN_COUR_ID = NEW_OPEN_COUR_ID;
    
    IF (SYSDATE > CHECK_START_DATE)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    
     -- �̹� ������û �ߴ��� Ȯ�� (���� �� ��������)
    SELECT NVL((SELECT STU_ID
               FROM APP
               WHERE OPEN_COUR_ID = NEW_OPEN_COUR_ID),'0') INTO CHECK_STU_ID
    FROM DUAL;
    
    IF (CHECK_STU_ID = V_STU_ID)
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    


    -- UPDATE ������ ����
    UPDATE APP
    SET OPEN_COUR_ID = NEW_OPEN_COUR_ID
    WHERE APP_ID = V_APP_ID;
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20009, '������ ã�� �� �����ϴ�.' );
    WHEN USER_DEFINE_ERROR2
    THEN RAISE_APPLICATION_ERROR(-20010, '������û(���� �� öȸ) �Ⱓ�� �������ϴ�.' );
    WHEN USER_DEFINE_ERROR3
    THEN RAISE_APPLICATION_ERROR(-20011, '�̹� ������û�� �����Դϴ�.' );
    WHEN USER_DEFINE_ERROR4
    THEN RAISE_APPLICATION_ERROR(-20011, '������ûID�� ã�� �� �����ϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 33. ���� ��û ���� PRC_APP_DELETE(������ûID) ����--
CREATE OR REPLACE PROCEDURE PRC_APP_DELETE
( V_APP_ID          IN APP.APP_ID%TYPE
)
IS
-- �����
    
    V_OPEN_COUR_ID      OPEN_COUR.OPEN_COUR_ID%TYPE;
    V_STU_ID            STU.STU_ID%TYPE;

    CHECK_STU_ID        STU.STU_ID%TYPE; -- �ش� ���������ڵ忡 �л�ID�� �ߺ����� �� �� ������
    CHECK_OPEN_COUR_ID  OPEN_COUR.OPEN_COUR_ID%TYPE;
    CHECK_START_DATE    OPEN_COUR.START_DATE%TYPE;
    CHECK_APP_ID        APP.APP_ID%TYPE;

    
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;

    
BEGIN
    
    
     -- ������ûID�� ������ Ȯ��
    SELECT NVL((SELECT APP_ID
               FROM APP
               WHERE APP_ID = V_APP_ID),'0') INTO CHECK_APP_ID
    FROM DUAL;
    
    IF (CHECK_APP_ID = '0')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    -- ������ �����
    SELECT OPEN_COUR_ID INTO V_OPEN_COUR_ID
    FROM APP
    WHERE APP_ID = V_APP_ID;
    
    
    -- ����öȸ�� �������� Ȯ�� (���� ���۳�¥ ����)
    SELECT START_DATE   INTO CHECK_START_DATE
    FROM OPEN_COUR
    WHERE OPEN_COUR_ID = V_OPEN_COUR_ID;
    
    IF (SYSDATE > CHECK_START_DATE)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;

    
    -- DELETE ������ ����
    DELETE
    FROM APP
    WHERE APP_ID = V_APP_ID;
    
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
    THEN RAISE_APPLICATION_ERROR(-20009, '������ûID�� ã�� �� �����ϴ�.' );
    WHEN USER_DEFINE_ERROR2
    THEN RAISE_APPLICATION_ERROR(-20010, '������û(���� �� öȸ) �Ⱓ�� �������ϴ�.' );
    ROLLBACK;
    
    -- Ŀ��
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 34. �ߵ� Ż�� ���� �Է� PRC_REASONS_DROPOUT_INSERT(Ż������) ����--
CREATE OR REPLACE PROCEDURE PRC_REASONS_DROPOUT_INSERT
(V_REASON_DROPOUT   IN REASONS_DROPOUT.REASON_DROPOUT%TYPE)
IS
    COUNTNUM    NUMBER;
BEGIN
    
    SELECT COUNT(*) INTO COUNTNUM
    FROM REASONS_DROPOUT;
    
    -- ù ���ڵ� �Է��̸� ������ �ʱ�ȭ
    IF (COUNTNUM = 0)
        THEN PRC_RESET_SEQ('SEQ_REASONS_DROPOUT');
    END IF;
    
    INSERT INTO REASONS_DROPOUT(REASONS_DROPOUT_ID, REASON_DROPOUT)
    VALUES(CONCAT('DR', TO_CHAR(LPAD(SEQ_REASONS_DROPOUT.NEXTVAL, 3, 0))), V_REASON_DROPOUT);  
    
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 35. �ߵ� Ż�� ���� ���� PRC_REASONS_DROPOUT_UPDATE(�ߵ�Ż���ڵ�, Ż������) ����--
CREATE OR REPLACE PROCEDURE PRC_REASONS_DROPOUT_UPDATE
( V_REASONS_DROPOUT_ID IN REASONS_DROPOUT.REASONS_DROPOUT_ID%TYPE
, V_REASON_DROPOUT    IN REASONS_DROPOUT.REASON_DROPOUT%TYPE
)
IS
BEGIN
    UPDATE REASONS_DROPOUT
    SET REASON_DROPOUT = V_REASON_DROPOUT
    WHERE REASONS_DROPOUT_ID = V_REASONS_DROPOUT_ID;
    
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 36. �ߵ� Ż�� ���� ���� PRC_REASONS_DROPOUT_DELETE(�ߵ�Ż���ڵ�) ����--
CREATE OR REPLACE PROCEDURE PRC_REASONS_DROPOUT_DELETE
( V_REASONS_DROPOUT_ID IN REASONS_DROPOUT.REASONS_DROPOUT_ID%TYPE )
IS
BEGIN
    DELETE
    FROM REASONS_DROPOUT
    WHERE REASONS_DROPOUT_ID = V_REASONS_DROPOUT_ID;
    
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 37. ������ �ʱ�ȭ PRC_RESET_SEQ(��������) ����--
CREATE OR REPLACE PROCEDURE PRC_RESET_SEQ
( V_SEQ_NAME IN VARCHAR2 )
IS
    V_SEQ_VAL NUMBER;
BEGIN
    -- ���������� ���� SEQ_VAL ������ ����
    EXECUTE IMMEDIATE 'SELECT ' || V_SEQ_NAME || '.NEXTVAL FROM DUAL' INTO V_SEQ_VAL;

    -- ������ ���������� ����� ��(SEQ_VAL)�� ���ش�. �׷� 0���� �ʱ�ȭ ��.
    EXECUTE IMMEDIATE 'ALTER SEQUENCE ' || V_SEQ_NAME || ' INCREMENT BY -' || V_SEQ_VAL || ' MINVALUE 0';

    -- 0���� �ʱ�ȭ �� ������ ���� Ȯ��
    EXECUTE IMMEDIATE 'SELECT ' || V_SEQ_NAME || '.NEXTVAL FROM DUAL' INTO V_SEQ_VAL;

    -- ���ݺ��ʹ� 1�� �����ǵ��� �������� ������.
    EXECUTE IMMEDIATE 'ALTER SEQUENCE ' || V_SEQ_NAME || ' INCREMENT BY 1 MINVALUE 0';
END PRC_RESET_SEQ;
--------------------------------------------------------------------------------
--���� 38. �ߵ�Ż������Ʈ �Է� PRC_DROPOUT_INSERT ����--
CREATE OR REPLACE PROCEDURE PRC_DROPOUT_INSERT
( V_APP_ID                  IN DROPOUT.APP_ID%TYPE
, V_REASONS_DROPOUT_ID      IN DROPOUT.REASONS_DROPOUT_ID%TYPE
--, V_DROPOUT_DATE            IN DROPOUT.DROPOUT_DATE%TYPE
)
IS  
    V_DROPOUT_ID   DROPOUT.DROPOUT_ID%TYPE;   -- �ߵ����� �ڵ� (�������� �ڵ�����)
    
    V_START_DATE   OPEN_COUR.START_DATE%TYPE; -- ���� ������ ���
    V_END_DATE     OPEN_COUR.END_DATE%TYPE;   -- ���� ������ ���
    
    USER_DEFINE_ERROR EXCEPTION;              -- �ߵ��������� �����Ⱓ �ȿ� ������ ����
    
BEGIN
    SELECT START_DATE, END_DATE INTO V_START_DATE, V_END_DATE
    FROM OPEN_COUR
    WHERE OPEN_COUR_ID = (SELECT OPEN_COUR_ID
                          FROM APP
                          WHERE APP_ID = V_APP_ID);
    
    IF (SYSDATE NOT BETWEEN V_START_DATE AND V_END_DATE)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    INSERT INTO DROPOUT(DROPOUT_ID, APP_ID, REASONS_DROPOUT_ID)
         VALUES('D' || LPAD(TO_CHAR(DROPOUT_SEQ.NEXTVAL), 5, '0'), V_APP_ID, V_REASONS_DROPOUT_ID);
          
    EXCEPTION
        WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20025, '�ߵ��������� �����Ⱓ�� �ƴմϴ�.');
        ROLLBACK;
        /*
        WHEN OTHERS
        THEN ROLLBACK;
        */
    COMMIT;
END;
--------------------------------------------------------------------------------
--���� 39. �ߵ�Ż������Ʈ ���� PRC_DROPOUT_UPDATE ����--
CREATE OR REPLACE PROCEDURE PRC_DROPOUT_UPDATE
( V_DROPOUT_ID           IN DROPOUT.DROPOUT_ID%TYPE  
, V_APP_ID               IN DROPOUT.APP_ID%TYPE
, V_DROPOUT_DATE         IN DROPOUT.DROPOUT_DATE%TYPE
)
IS

    V_START_DATE   OPEN_COUR.START_DATE%TYPE; -- ���� ������ ���
    V_END_DATE     OPEN_COUR.END_DATE%TYPE;   -- ���� ������ ���
    
    USER_DEFINE_ERROR EXCEPTION;              -- �ߵ��������� �����Ⱓ �ȿ� ������ ����
    
BEGIN
    
    SELECT OC.START_DATE, OC.END_DATE INTO V_START_DATE, V_END_DATE
    FROM OPEN_COUR OC JOIN APP AP  
        ON OC.OPEN_COUR_ID = AP.OPEN_COUR_ID
        JOIN DROPOUT DR
        ON DR.APP_ID = AP.APP_ID
    WHERE DR.DROPOUT_ID = V_DROPOUT_ID;
    
    IF (V_DROPOUT_DATE NOT BETWEEN V_START_DATE AND V_END_DATE)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    UPDATE DROPOUT
    SET DROPOUT_DATE = V_DROPOUT_DATE, APP_ID = V_APP_ID
    WHERE DROPOUT_ID = V_DROPOUT_ID;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20025, '�ߵ��������� �����Ⱓ�� �ƴմϴ�.');
        ROLLBACK;
        WHEN OTHERS
        THEN ROLLBACK;
        
    COMMIT; 
   
END;
--------------------------------------------------------------------------------
--���� 40. �������� ��� PCR_OP_COUR_INSERT(����������, ������, ���ǽ�_ID,����ID, �ڽ�ID ) ����--
CREATE OR REPLACE PROCEDURE PRC_OP_COUR_INSERT
( V_ST_DATE   IN OPEN_COUR.START_DATE%TYPE
, V_END_DATE  IN OPEN_COUR.END_DATE%TYPE
, V_CLASS     IN CLASS.CLASS_ID%TYPE
, V_PROF_ID   IN PROF.PROF_ID%TYPE
, V_COURSE_ID IN COURSE.COURSE_ID%TYPE
)
IS

    V_OPEN_COUR_ID OPEN_COUR.OPEN_COUR_ID%TYPE;
    V_OLD_ST_DATE   OPEN_COUR.START_DATE%TYPE;
    V_OLD_END_DATE  OPEN_COUR.END_DATE%TYPE;
    V_OLD_PROF_ID   PROF.PROF_ID%TYPE;
    V_OLD_CLASS     CLASS.CLASS_ID%TYPE;    
    
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION; -- ���۳�¥ > ������¥ �϶� �߻�
    
    CURSOR CUR_CHECK_DATE 
    IS 
    SELECT PROF_ID, START_DATE, END_DATE, CLASS_ID
    FROM OPEN_COUR;   
    
BEGIN

    IF  (V_END_DATE - V_ST_DATE < 0) 
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;    
    
    OPEN CUR_CHECK_DATE;
    
    LOOP 
        FETCH CUR_CHECK_DATE INTO V_OLD_PROF_ID, V_OLD_ST_DATE, V_OLD_END_DATE, V_OLD_CLASS;
        
        EXIT WHEN CUR_CHECK_DATE%NOTFOUND;
  
        IF(V_ST_DATE <= V_OLD_ST_DATE AND  V_END_DATE >= V_OLD_ST_DATE AND (V_OLD_PROF_ID = V_PROF_ID OR V_OLD_CLASS = V_CLASS))
            THEN RAISE USER_DEFINE_ERROR;
        ELSIF (V_ST_DATE <= V_OLD_END_DATE AND V_END_DATE >= V_OLD_END_DATE AND (V_OLD_PROF_ID = V_PROF_ID OR V_OLD_CLASS = V_CLASS))
            THEN RAISE USER_DEFINE_ERROR;
        ELSIF (V_ST_DATE >= V_OLD_ST_DATE AND V_END_DATE <= V_OLD_END_DATE AND (V_OLD_PROF_ID = V_PROF_ID OR V_OLD_CLASS = V_CLASS))  
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
       
  
    END LOOP;
    
    CLOSE CUR_CHECK_DATE;
    
    
    V_OPEN_COUR_ID := CONCAT('OC', TO_CHAR(SYSDATE, 'YY'));
    
    INSERT INTO OPEN_COUR(OPEN_COUR_ID, START_DATE, END_DATE, CLASS_ID, PROF_ID, COURSE_ID)
    VALUES (V_OPEN_COUR_ID || LPAD(TO_CHAR(SEQ_OPEN_COUR.NEXTVAL), 3, '0'), V_ST_DATE, V_END_DATE, V_CLASS, V_PROF_ID, V_COURSE_ID);  
    
   COMMIT;   

   EXCEPTION
    WHEN USER_DEFINE_ERROR
     THEN RAISE_APPLICATION_ERROR(-20006, '�̹� �������� ������ ���ǽ� �Ǵ� �������Դϴ�.' );
     ROLLBACK; 
    WHEN USER_DEFINE_ERROR2
     THEN  RAISE_APPLICATION_ERROR(-20008, '�������� �����Ϻ��� �����Դϴ�.' ); 
     ROLLBACK;
    
    WHEN OTHERS
    THEN ROLLBACK;
END;
--------------------------------------------------------------------------------
--���� 41. �������� ���� PRC_OP_COUR_UPDATE(���������ڵ�, ����������, ������, ���ǽ�_ID,����ID, �ڽ�ID ) ����--
CREATE OR REPLACE PROCEDURE PRC_OP_COUR_UPDATE
( V_OPEN_COUR_ID IN OPEN_COUR.OPEN_COUR_ID%TYPE
, V_ST_DATE   IN OPEN_COUR.START_DATE%TYPE
, V_END_DATE  IN OPEN_COUR.END_DATE%TYPE
, V_CLASS     IN CLASS.CLASS_ID%TYPE
, V_PROF_ID   IN PROF.PROF_ID%TYPE
, V_COURSE_ID IN COURSE.COURSE_ID%TYPE
)
IS
    
    V_OLD_ST_DATE   OPEN_COUR.START_DATE%TYPE;
    V_OLD_END_DATE  OPEN_COUR.END_DATE%TYPE;
    V_OLD_PROF_ID   PROF.PROF_ID%TYPE;
    V_OLD_CLASS     CLASS.CLASS_ID%TYPE;    
    
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION; -- ���۳�¥ > ������¥ �϶� �߻�
    
    CURSOR CUR_CHECK_DATE 
    IS 
    SELECT PROF_ID, START_DATE, END_DATE, CLASS_ID
    FROM OPEN_COUR;   
    
BEGIN

    IF  (V_END_DATE - V_ST_DATE < 0) 
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;    
    
    DELETE
    FROM OPEN_COUR
    WHERE OPEN_COUR_ID = V_OPEN_COUR_ID;


    OPEN CUR_CHECK_DATE;
    
    LOOP 
        FETCH CUR_CHECK_DATE INTO V_OLD_PROF_ID, V_OLD_ST_DATE, V_OLD_END_DATE, V_OLD_CLASS;
        
        EXIT WHEN CUR_CHECK_DATE%NOTFOUND;
  
        IF(V_ST_DATE <= V_OLD_ST_DATE AND  V_END_DATE >= V_OLD_ST_DATE AND (V_OLD_PROF_ID = V_PROF_ID OR V_OLD_CLASS = V_CLASS))
            THEN RAISE USER_DEFINE_ERROR;
        ELSIF (V_ST_DATE <= V_OLD_END_DATE AND V_END_DATE >= V_OLD_END_DATE AND (V_OLD_PROF_ID = V_PROF_ID OR V_OLD_CLASS = V_CLASS))
            THEN RAISE USER_DEFINE_ERROR;
        ELSIF (V_ST_DATE >= V_OLD_ST_DATE AND V_END_DATE <= V_OLD_END_DATE AND (V_OLD_PROF_ID = V_PROF_ID OR V_OLD_CLASS = V_CLASS))  
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
       
  
    END LOOP;
    
    CLOSE CUR_CHECK_DATE;
    
    
    INSERT INTO OPEN_COUR(OPEN_COUR_ID, START_DATE, END_DATE, CLASS_ID, PROF_ID, COURSE_ID)
    VALUES (V_OPEN_COUR_ID, V_ST_DATE, V_END_DATE, V_CLASS, V_PROF_ID, V_COURSE_ID);  
    
   COMMIT;   

   EXCEPTION
    WHEN USER_DEFINE_ERROR
     THEN RAISE_APPLICATION_ERROR(-20006, '�̹� �������� ������ ���ǽ� �Ǵ� �������Դϴ�.' );
     ROLLBACK; 
    WHEN USER_DEFINE_ERROR2
     THEN  RAISE_APPLICATION_ERROR(-20008, '�������� �����Ϻ��� �����Դϴ�.' ); 
     ROLLBACK;
    
    WHEN OTHERS
    THEN ROLLBACK;
END;
--------------------------------------------------------------------------------
--���� 42. �������� ���� (����) ����--
DELETE 
FROM OPEN_COUR
WHERE OPEN_COUR_ID = '???';
--------------------------------------------------------------------------------
--���� 43. �������� ��� PRC_OP_SUBJ_INSERT (���������, ����������, ���������ڵ�, �����ڵ�, �����ڵ�, �ʱ����, �Ǳ����, ������) ����--
CREATE OR REPLACE PROCEDURE PRC_OP_SUBJ_INSERT
( V_START_DATE  IN OPEN_SUBJ.START_DATE%TYPE
, V_END_DATE    IN OPEN_SUBJ.END_DATE%TYPE
, V_OP_COUR_ID  IN OPEN_COUR.OPEN_COUR_ID%TYPE
, V_BOOK_ID     IN BOOK.BOOK_ID%TYPE
, V_SUBJ_ID     IN SUBJECT.SUBJECT_ID%TYPE
, V_WRITE       IN OPEN_SUBJ.WRITE_POINT%TYPE
, V_PRACTICE    IN OPEN_SUBJ.PRACTICE_POINT%TYPE
, V_ATTEND      IN OPEN_SUBJ.ATTEND_POINT%TYPE
)
IS
    
    V_OP_SUBJ_ID  OPEN_SUBJ.OPEN_SUBJ_ID%TYPE; -- �������� �ڵ�
    
    CHECK_OP_COUR OPEN_COUR.OPEN_COUR_ID%TYPE;
    -- ���� ���� �ڵ� ���� üũ
    
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2  EXCEPTION;
    USER_DEFINE_ERROR3  EXCEPTION;
    USER_DEFINE_ERROR4  EXCEPTION;
    
    COUR_START  DATE;    -- ���� ���� ������
    COUR_END    DATE;    -- ���� ���� ������
    
    OLD_START   DATE;    -- ���� ���� ������
    OLD_END     DATE;    -- ���� ���� ������ 
    
    
    CURSOR CUR_CHECK_DATE 
    IS 
    SELECT START_DATE, END_DATE
    FROM OPEN_SUBJ
    WHERE OPEN_COUR_ID = V_OP_COUR_ID;   
    

BEGIN
        IF (V_WRITE + V_PRACTICE + V_ATTEND != 100)
        THEN RAISE USER_DEFINE_ERROR4;
        END IF;
        
        SELECT NVL(MAX(OPEN_COUR_ID), '0') INTO CHECK_OP_COUR
        FROM OPEN_COUR
        WHERE OPEN_COUR_ID =V_OP_COUR_ID;
        
        IF CHECK_OP_COUR = '0'
          THEN RAISE USER_DEFINE_ERROR; 
        END IF;
        
        SELECT START_DATE, END_DATE INTO  COUR_START , COUR_END
        FROM OPEN_COUR
        WHERE OPEN_COUR_ID = V_OP_COUR_ID;
                
            
       --2  ���� �Է��� ������ < �ڽ������� OR �ڽ������� < ���� �Է��� ������  �� ����
        
        IF (V_START_DATE < COUR_START OR COUR_END  < V_END_DATE)
           THEN RAISE USER_DEFINE_ERROR2;  
        END IF; 
        
     
     --3 ���� �ִ� ������ �Ⱓ�� ��ġ�� �ȵ�. �� �������� �ϵ��� �ؾ���. 
       
    OPEN CUR_CHECK_DATE;
        LOOP
            
        FETCH CUR_CHECK_DATE INTO OLD_START, OLD_END;
        
        EXIT WHEN CUR_CHECK_DATE%NOTFOUND;
  
        IF(V_START_DATE <= OLD_START AND  V_END_DATE >= OLD_START)
            THEN RAISE USER_DEFINE_ERROR3;
        ELSIF (V_START_DATE <= OLD_END AND V_END_DATE >= OLD_END)
            THEN RAISE USER_DEFINE_ERROR3;
        ELSIF (V_START_DATE >= OLD_START AND V_END_DATE <= OLD_END)  
            THEN RAISE USER_DEFINE_ERROR3;
        END IF;
       
  
        END LOOP;
    
    CLOSE CUR_CHECK_DATE;
    
    
    V_OP_SUBJ_ID := 'OS' || TO_CHAR(SYSDATE, 'YY'); 
     
    
    
    INSERT INTO OPEN_SUBJ(OPEN_SUBJ_ID, START_DATE, END_DATE, OPEN_COUR_ID, BOOK_ID, SUBJECT_ID, WRITE_POINT, PRACTICE_POINT, ATTEND_POINT)
    VALUES (V_OP_SUBJ_ID || LPAD(TO_CHAR(OP_SUBJ_SEQ.NEXTVAL), 5, '0'), V_START_DATE, V_END_DATE, V_OP_COUR_ID
          , V_BOOK_ID, V_SUBJ_ID, V_WRITE, V_PRACTICE, V_ATTEND);
       
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20020, '���� ���������Դϴ�.' );
        ROLLBACK; 
        
        WHEN USER_DEFINE_ERROR2
        THEN  RAISE_APPLICATION_ERROR(-20021, '���������� �������º��� ����/�����ϼ� �����ϴ�.' ); 
        ROLLBACK;
        
        WHEN USER_DEFINE_ERROR3
        THEN  RAISE_APPLICATION_ERROR(-20022, '�Է±Ⱓ�� �������� ������ �ֽ��ϴ�.' ); 
        ROLLBACK;
        
        WHEN USER_DEFINE_ERROR4
        THEN  RAISE_APPLICATION_ERROR(-20023, '������ ������ 100���̾�� �մϴ�.' ); 
        ROLLBACK;
        
        WHEN OTHERS
        THEN ROLLBACK;
END; 
--------------------------------------------------------------------------------
--���� 44. �������� ���� PRC_OP_SUBJ_UPDATE (���������ڵ�, ���������, ����������, ���������ڵ�, �����ڵ�, �����ڵ�, �ʱ����, �Ǳ����, ������) ����--
CREATE OR REPLACE PROCEDURE PRC_OP_SUBJ_UPDATE
( V_OP_SUBJ_ID  IN OPEN_SUBJ.OPEN_SUBJ_ID%TYPE  -- �������� �ڵ�
, V_START_DATE  IN OPEN_SUBJ.START_DATE%TYPE    -- ������
, V_END_DATE    IN OPEN_SUBJ.END_DATE%TYPE      -- ������
, V_OP_COUR_ID  IN OPEN_COUR.OPEN_COUR_ID%TYPE  -- �������� �ڵ�
, V_BOOK_ID     IN BOOK.BOOK_ID%TYPE            -- å �ڵ� 
, V_SUBJ_ID     IN SUBJECT.SUBJECT_ID%TYPE      -- �����ڵ�
, V_WRITE       IN OPEN_SUBJ.WRITE_POINT%TYPE   -- �ʱ����
, V_PRACTICE    IN OPEN_SUBJ.PRACTICE_POINT%TYPE -- �Ǳ����
, V_ATTEND      IN OPEN_SUBJ.ATTEND_POINT%TYPE  -- �⼮����
)
IS
    
    CHECK_OP_COUR OPEN_COUR.OPEN_COUR_ID%TYPE;
    -- ���� ���� �ڵ� ���� üũ
    CHECK_OP_SUBJ OPEN_SUBJ.OPEN_SUBJ_ID%TYPE;
    -- ���� ���� �ڵ� ���� üũ
    
    USER_DEFINE_ERROR   EXCEPTION; -- ���� �������� ����
    USER_DEFINE_ERROR2  EXCEPTION; -- ������ �������̳� �������� ������ ������ �����Ϻ��� �����̳� �����϶� ����
    USER_DEFINE_ERROR3  EXCEPTION; -- ���� ����� �Ⱓ�� ��ġ�� ����
    USER_DEFINE_ERROR4  EXCEPTION; -- ���� ���� ����
    USER_DEFINE_ERROR5  EXCEPTION; -- ���� ���� ���� ����
    
    COUR_START  DATE;    -- ���� ���� ������
    COUR_END    DATE;    -- ���� ���� ������
    
    OLD_START   DATE;    -- ���� ���� ������
    OLD_END     DATE;    -- ���� ���� ������ 
    
    
    CURSOR CUR_CHECK_DATE 
    IS 
    SELECT START_DATE, END_DATE
    FROM OPEN_SUBJ
    WHERE OPEN_COUR_ID = V_OP_COUR_ID;   
    

BEGIN
        SELECT NVL(MAX(OPEN_COUR_ID), '0') INTO CHECK_OP_SUBJ
        FROM OPEN_SUBJ
        WHERE OPEN_SUBJ_ID = V_OP_SUBJ_ID;
        
        -- ���� 5
        IF CHECK_OP_SUBJ = '0'
        THEN RAISE USER_DEFINE_ERROR5;
        END IF;

        -- ���� 4
        IF (V_WRITE + V_PRACTICE + V_ATTEND != 100)
        THEN RAISE USER_DEFINE_ERROR4;
        END IF;
        
        SELECT NVL(MAX(OPEN_COUR_ID), '0') INTO CHECK_OP_COUR
        FROM OPEN_COUR
        WHERE OPEN_COUR_ID =V_OP_COUR_ID;
        -- ���� 1
        IF CHECK_OP_COUR = '0'
          THEN RAISE USER_DEFINE_ERROR;  -- ������ �������� �ʴ´ٸ� ����
        END IF;
        
        SELECT START_DATE, END_DATE INTO  COUR_START , COUR_END
        FROM OPEN_COUR
        WHERE OPEN_COUR_ID = V_OP_COUR_ID;
                
            
       --���� 2  ���� �Է��� ������ < �ڽ������� OR �ڽ������� < ���� �Է��� ������  �� ����
        
        IF (V_START_DATE < COUR_START OR COUR_END  < V_END_DATE)
           THEN RAISE USER_DEFINE_ERROR2;  
        END IF; 
        
     -- �Է� ������ ����
    DELETE
    FROM OPEN_SUBJ
    WHERE OPEN_SUBJ_ID = V_OP_SUBJ_ID;

     
     --���� 3 ���� �ִ� ������ �Ⱓ�� ��ġ�� �ȵ�. �� �������� �ϵ��� �ؾ���. 
       
     OPEN CUR_CHECK_DATE;
        LOOP
            
        FETCH CUR_CHECK_DATE INTO OLD_START, OLD_END;
        
        EXIT WHEN CUR_CHECK_DATE%NOTFOUND;
  
        IF(V_START_DATE <= OLD_START AND  V_END_DATE >= OLD_START)
            THEN RAISE USER_DEFINE_ERROR3;
        ELSIF (V_START_DATE <= OLD_END AND V_END_DATE >= OLD_END)
            THEN RAISE USER_DEFINE_ERROR3;
        ELSIF (V_START_DATE >= OLD_START AND V_END_DATE <= OLD_END)  
            THEN RAISE USER_DEFINE_ERROR3;
        END IF;
       
        END LOOP;
    
    CLOSE CUR_CHECK_DATE;
        
    INSERT INTO OPEN_SUBJ(OPEN_SUBJ_ID, START_DATE, END_DATE, OPEN_COUR_ID, BOOK_ID, SUBJECT_ID, WRITE_POINT, PRACTICE_POINT, ATTEND_POINT)
    VALUES (V_OP_SUBJ_ID , V_START_DATE, V_END_DATE, V_OP_COUR_ID
          , V_BOOK_ID, V_SUBJ_ID, V_WRITE, V_PRACTICE, V_ATTEND);
       
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20020, '���� ���������Դϴ�.' );
        ROLLBACK; 
        
        WHEN USER_DEFINE_ERROR2
        THEN  RAISE_APPLICATION_ERROR(-20021, '���������� �������º��� ����/�����ϼ� �����ϴ�.' ); 
        ROLLBACK;
        
        WHEN USER_DEFINE_ERROR3
        THEN  RAISE_APPLICATION_ERROR(-20022, '�Է±Ⱓ�� �������� ������ �ֽ��ϴ�.' ); 
        ROLLBACK;
        
        WHEN USER_DEFINE_ERROR4
        THEN  RAISE_APPLICATION_ERROR(-20023, '������ ������ 100���̾�� �մϴ�.' ); 
        ROLLBACK;
        
        WHEN USER_DEFINE_ERROR5
        THEN  RAISE_APPLICATION_ERROR(-20024, '������ ���� ID�� �ƴմϴ�.' ); 
        ROLLBACK;
        
        WHEN OTHERS
        THEN ROLLBACK;
END;
--------------------------------------------------------------------------------
--���� 45. �������� ���� (����) ����--
DELETE
FROM OPEN_SUBJ
WHERE OPEN_SUBJ_ID = '???';